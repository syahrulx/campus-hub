package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.util.DatabaseHelper;

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

        // Show checkout/payment page with cart summary
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
            // Process checkout - create orders from cart items
            boolean success = processCheckout(buyerId);

            if (success) {
                response.sendRedirect("orderSuccess.jsp");
            } else {
                request.setAttribute("error", "Checkout failed. Please try again.");
                response.sendRedirect("cart?error=Checkout+failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("cart?error=Database+error");
        }
    }

    private boolean processCheckout(String buyerId) throws SQLException {
        Connection conn = null;

        try {
            conn = DatabaseHelper.getConnection();
            conn.setAutoCommit(false); // Start transaction

            // Get user's cart
            String cartId = getCartId(conn, buyerId);
            if (cartId == null) {
                return false;
            }

            // Get all cart items with product details
            String selectSql = "SELECT ci.cart_item_id, ci.product_id, ci.quantity, " +
                    "p.seller_id, p.price, p.status " +
                    "FROM APP.CART_ITEM ci " +
                    "JOIN APP.PRODUCT p ON ci.product_id = p.product_id " +
                    "WHERE ci.cart_id = ?";

            try (PreparedStatement pstmt = conn.prepareStatement(selectSql)) {
                pstmt.setString(1, cartId);

                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        String productId = rs.getString("product_id");
                        String sellerId = rs.getString("seller_id");
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        String status = rs.getString("status");

                        // Skip if product no longer available
                        if (!"AVAILABLE".equals(status)) {
                            continue;
                        }

                        // Create order
                        createOrder(conn, buyerId, sellerId, productId, quantity, price * quantity);

                        // Update product status to SOLD
                        updateProductStatus(conn, productId, "SOLD");
                    }
                }
            }

            // Clear the cart
            clearCart(conn, cartId);

            conn.commit(); // Commit transaction
            return true;

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback on error
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            throw e;
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private String getCartId(Connection conn, String userId) throws SQLException {
        String sql = "SELECT cart_id FROM APP.CART WHERE user_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("cart_id");
                }
            }
        }
        return null;
    }

    private void createOrder(Connection conn, String buyerId, String sellerId,
            String productId, int quantity, double totalAmount) throws SQLException {
        String sql = "INSERT INTO APP.ORDERS (order_id, product_id, buyer_id, seller_id, quantity, total_amount, status) "
                +
                "VALUES (?, ?, ?, ?, ?, ?, 'PENDING')";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "ord" + UUID.randomUUID().toString().substring(0, 8));
            pstmt.setString(2, productId);
            pstmt.setString(3, buyerId);
            pstmt.setString(4, sellerId);
            pstmt.setInt(5, quantity);
            pstmt.setDouble(6, totalAmount);
            pstmt.executeUpdate();
        }
    }

    private void updateProductStatus(Connection conn, String productId, String status) throws SQLException {
        String sql = "UPDATE APP.PRODUCT SET status = ? WHERE product_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setString(2, productId);
            pstmt.executeUpdate();
        }
    }

    private void clearCart(Connection conn, String cartId) throws SQLException {
        String sql = "DELETE FROM APP.CART_ITEM WHERE cart_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, cartId);
            pstmt.executeUpdate();
        }
    }
}
