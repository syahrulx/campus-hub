package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.util.DatabaseHelper;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String orderId = request.getParameter("orderId");
        if (orderId == null || orderId.isEmpty()) {
            response.sendRedirect("orders");
            return;
        }

        // Get order details for the review form
        Map<String, Object> orderInfo = getOrderInfo(orderId);
        if (orderInfo == null) {
            response.sendRedirect("orders?error=Order not found");
            return;
        }

        // Check if already reviewed
        if (hasReviewed(orderId)) {
            request.setAttribute("alreadyReviewed", true);
        }

        request.setAttribute("orderInfo", orderInfo);
        request.getRequestDispatcher("/review.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String reviewerId = (String) session.getAttribute("userId");
        String orderId = request.getParameter("orderId");
        String sellerId = request.getParameter("sellerId");
        String ratingStr = request.getParameter("rating");
        String comment = request.getParameter("comment");

        // Validate inputs
        if (orderId == null || sellerId == null || ratingStr == null) {
            response.sendRedirect("orders?error=Invalid review data");
            return;
        }

        int rating;
        try {
            rating = Integer.parseInt(ratingStr);
            if (rating < 1 || rating > 5) {
                throw new NumberFormatException();
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("review?orderId=" + orderId + "&error=Invalid rating");
            return;
        }

        // Check if already reviewed
        if (hasReviewed(orderId)) {
            response.sendRedirect("orders?error=Already reviewed");
            return;
        }

        // Submit review
        boolean success = submitReview(reviewerId, sellerId, orderId, rating, comment);

        if (success) {
            // Update seller's average rating
            updateSellerRating(sellerId);
            response.sendRedirect("orders?success=Review submitted successfully!");
        } else {
            response.sendRedirect("review?orderId=" + orderId + "&error=Failed to submit review");
        }
    }

    private Map<String, Object> getOrderInfo(String orderId) {
        String sql = "SELECT o.order_id, o.seller_id, o.status, p.name as product_name, " +
                "p.image_url, u.name as seller_name " +
                "FROM APP.ORDERS o " +
                "JOIN APP.PRODUCT p ON o.product_id = p.product_id " +
                "JOIN APP.USERS u ON o.seller_id = u.user_id " +
                "WHERE o.order_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, orderId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Map<String, Object> info = new HashMap<>();
                    info.put("orderId", rs.getString("order_id"));
                    info.put("sellerId", rs.getString("seller_id"));
                    info.put("status", rs.getString("status"));
                    info.put("productName", rs.getString("product_name"));
                    info.put("imageUrl", rs.getString("image_url"));
                    info.put("sellerName", rs.getString("seller_name"));
                    return info;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private boolean hasReviewed(String orderId) {
        String sql = "SELECT COUNT(*) FROM APP.REVIEW WHERE order_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, orderId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean submitReview(String reviewerId, String sellerId, String orderId, int rating, String comment) {
        String sql = "INSERT INTO APP.REVIEW (review_id, reviewer_id, seller_id, order_id, rating, comment) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "rev" + UUID.randomUUID().toString().substring(0, 8));
            pstmt.setString(2, reviewerId);
            pstmt.setString(3, sellerId);
            pstmt.setString(4, orderId);
            pstmt.setInt(5, rating);
            pstmt.setString(6, comment);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private void updateSellerRating(String sellerId) {
        String sql = "UPDATE APP.USERS SET rating = " +
                "(SELECT AVG(CAST(rating AS DOUBLE)) FROM APP.REVIEW WHERE seller_id = ?) " +
                "WHERE user_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, sellerId);
            pstmt.setString(2, sellerId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
