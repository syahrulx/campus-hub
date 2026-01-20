package com.campushub.servlet;

import com.campushub.util.DatabaseHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // If you have a dedicated checkout page, forward to it.
        // Otherwise, keep showing cart summary.
        response.sendRedirect("cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String buyerId = (String) session.getAttribute("userId");

        try {
            boolean success = processCheckout(buyerId);

            if (success) {
                response.sendRedirect("orderSuccess.jsp");
            } else {
                // redirect with message (request attributes won't survive redirect)
                response.sendRedirect("cart?error=Checkout+failed.+Some+items+are+unavailable+or+out+of+stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("cart?error=Database+error");
        }
    }

    private boolean processCheckout(String buyerId) throws SQLException {
        try (Connection conn = DatabaseHelper.getConnection()) {
            conn.setAutoCommit(false);

            try {
                String cartId = getCartId(conn, buyerId);
                if (cartId == null) {
                    conn.rollback();
                    return false;
                }

                // No FOR UPDATE (Derby issues). Just read cart + product info.
                String selectSql
                        = "SELECT ci.product_id, ci.quantity AS cart_qty, "
                        + "       p.seller_id, p.price, p.status, p.quantity AS stock_qty "
                        + "FROM APP.CART_ITEM ci "
                        + "JOIN APP.PRODUCT p ON ci.product_id = p.product_id "
                        + "WHERE ci.cart_id = ?";

                boolean hasAnyItem = false;

                try (PreparedStatement ps = conn.prepareStatement(selectSql)) {
                    ps.setString(1, cartId);

                    try (ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) {
                            hasAnyItem = true;

                            String productId = rs.getString("product_id");
                            String sellerId = rs.getString("seller_id");
                            int cartQty = rs.getInt("cart_qty");
                            double price = rs.getDouble("price");
                            String status = rs.getString("status");
                            int stockQty = rs.getInt("stock_qty");

                            // quick fail
                            if (cartQty <= 0 || !"AVAILABLE".equalsIgnoreCase(status) || stockQty < cartQty) {
                                conn.rollback();
                                return false;
                            }

                            // 1) Decrement stock atomically (prevents oversell without FOR UPDATE)
                            int updated = decrementStockIfAvailable(conn, productId, cartQty);
                            if (updated == 0) {
                                conn.rollback();
                                return false;
                            }

                            // 2) Mark SOLD if stock hits 0
                            markSoldIfZero(conn, productId);

                            // 3) Create order
                            double totalAmount = price * cartQty;
                            createOrder(conn, buyerId, sellerId, productId, cartQty, totalAmount);
                        }
                    }
                }

                if (!hasAnyItem) {
                    conn.rollback();
                    return false;
                }

                clearCart(conn, cartId);

                conn.commit();
                return true;

            } catch (SQLException ex) {
                conn.rollback();
                throw ex;
            } finally {
                conn.setAutoCommit(true);
            }
        }
    }

    private int decrementStockIfAvailable(Connection conn, String productId, int cartQty) throws SQLException {
        String sql
                = "UPDATE APP.PRODUCT "
                + "SET quantity = quantity - ? "
                + "WHERE product_id = ? "
                + "  AND status = 'AVAILABLE' "
                + "  AND quantity >= ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, cartQty);
            ps.setString(2, productId);
            ps.setInt(3, cartQty);
            return ps.executeUpdate(); // 1 = success, 0 = not enough stock / not available
        }
    }

    private void markSoldIfZero(Connection conn, String productId) throws SQLException {
        String sql
                = "UPDATE APP.PRODUCT "
                + "SET status = 'SOLD' "
                + "WHERE product_id = ? AND quantity = 0";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, productId);
            ps.executeUpdate();
        }
    }

    private String getCartId(Connection conn, String userId) throws SQLException {
        String sql = "SELECT cart_id FROM APP.CART WHERE user_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getString("cart_id") : null;
            }
        }
    }

    private void createOrder(Connection conn, String buyerId, String sellerId,
            String productId, int quantity, double totalAmount) throws SQLException {

        // If your DB treats ORDERS as reserved or problematic, rename table or quote it.
        String sql
                = "INSERT INTO APP.ORDERS "
                + "(order_id, product_id, buyer_id, seller_id, quantity, total_amount, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, 'PENDING')";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "ord" + UUID.randomUUID().toString().substring(0, 8));
            ps.setString(2, productId);
            ps.setString(3, buyerId);
            ps.setString(4, sellerId);
            ps.setInt(5, quantity);
            ps.setDouble(6, totalAmount);
            ps.executeUpdate();
        }
    }

    private void updateProductStockAndStatus(Connection conn, String productId, int newQuantity, String newStatus)
            throws SQLException {

        String sql = "UPDATE APP.PRODUCT SET quantity = ?, status = ? WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, newQuantity);
            ps.setString(2, newStatus);
            ps.setString(3, productId);
            ps.executeUpdate();
        }
    }

    private void clearCart(Connection conn, String cartId) throws SQLException {
        String sql = "DELETE FROM APP.CART_ITEM WHERE cart_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cartId);
            ps.executeUpdate();
        }
    }
}