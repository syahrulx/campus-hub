package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.util.DatabaseHelper;

@WebServlet("/sellerOrders")
public class SellerOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String sellerId = (String) session.getAttribute("userId");
        String filter = request.getParameter("filter"); // "pending", "shipped", "all"

        if (filter == null)
            filter = "pending";

        List<Object[]> sellerOrders = getSellerOrders(sellerId, filter);
        request.setAttribute("sellerOrders", sellerOrders);
        request.setAttribute("currentFilter", filter);

        // Get counts for tabs
        int pendingCount = DatabaseHelper.count("ORDERS", "seller_id = ? AND status = 'PENDING'", sellerId);
        int shippedCount = DatabaseHelper.count("ORDERS", "seller_id = ? AND status = 'SHIPPED'", sellerId);
        int completedCount = DatabaseHelper.count("ORDERS", "seller_id = ? AND status = 'COMPLETED'", sellerId);

        request.setAttribute("pendingCount", pendingCount);
        request.setAttribute("shippedCount", shippedCount);
        request.setAttribute("completedCount", completedCount);

        request.getRequestDispatcher("/sellerOrders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String sellerId = (String) session.getAttribute("userId");
        String orderId = request.getParameter("orderId");
        String action = request.getParameter("action");

        if (orderId != null && action != null) {
            // Verify this order belongs to the seller
            if (verifyOrderOwnership(orderId, sellerId)) {
                switch (action) {
                    case "ship":
                        updateOrderStatus(orderId, "SHIPPED");
                        break;
                    case "complete":
                        updateOrderStatus(orderId, "COMPLETED");
                        break;
                    case "cancel":
                        updateOrderStatus(orderId, "CANCELLED");
                        // Also restore product to AVAILABLE
                        restoreProduct(orderId);
                        break;
                }
            }
        }

        response.sendRedirect("sellerOrders?filter=pending");
    }

    private List<Object[]> getSellerOrders(String sellerId, String filter) {
        List<Object[]> orders = new ArrayList<>();

        String sql = "SELECT o.order_id, o.quantity, o.total_amount, o.status, o.ordered_at, " +
                "p.name, p.image_url, p.product_id, " +
                "u.name as buyer_name, u.email as buyer_email, u.phone as buyer_phone " +
                "FROM APP.ORDERS o " +
                "JOIN APP.PRODUCT p ON o.product_id = p.product_id " +
                "JOIN APP.USERS u ON o.buyer_id = u.user_id " +
                "WHERE o.seller_id = ?";

        if ("pending".equals(filter)) {
            sql += " AND o.status = 'PENDING'";
        } else if ("shipped".equals(filter)) {
            sql += " AND o.status = 'SHIPPED'";
        } else if ("completed".equals(filter)) {
            sql += " AND o.status = 'COMPLETED'";
        }

        sql += " ORDER BY o.ordered_at DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, sellerId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Object[] order = new Object[11];
                    order[0] = rs.getString("order_id");
                    order[1] = rs.getString("name"); // product name
                    order[2] = rs.getInt("quantity");
                    order[3] = rs.getDouble("total_amount");
                    order[4] = rs.getString("status");
                    order[5] = rs.getTimestamp("ordered_at");
                    order[6] = rs.getString("image_url");
                    order[7] = rs.getString("buyer_name");
                    order[8] = rs.getString("buyer_email");
                    order[9] = rs.getString("buyer_phone");
                    order[10] = rs.getString("product_id");
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    private boolean verifyOrderOwnership(String orderId, String sellerId) {
        String sql = "SELECT 1 FROM APP.ORDERS WHERE order_id = ? AND seller_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, orderId);
            pstmt.setString(2, sellerId);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private void updateOrderStatus(String orderId, String status) {
        String sql = "UPDATE APP.ORDERS SET status = ? WHERE order_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setString(2, orderId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void restoreProduct(String orderId) {
        String sql = "UPDATE APP.PRODUCT SET status = 'AVAILABLE' WHERE product_id = " +
                "(SELECT product_id FROM APP.ORDERS WHERE order_id = ?)";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, orderId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
