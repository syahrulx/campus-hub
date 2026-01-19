package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.campushub.bean.Product;
import com.campushub.bean.User;
import com.campushub.util.DatabaseHelper;

@WebServlet("/seller")
public class SellerProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sellerId = request.getParameter("id");

        // If no seller ID provided, redirect to home
        if (sellerId == null || sellerId.isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        // Fetch seller info
        User seller = getSellerById(sellerId);

        if (seller == null) {
            request.setAttribute("error", "Seller not found");
            request.getRequestDispatcher("/sellerProfile.jsp").forward(request, response);
            return;
        }

        // Get seller's products (active listings)
        List<Product> products = getSellerProducts(sellerId);

        // Get seller stats
        int itemsSold = DatabaseHelper.count("PRODUCT", "seller_id = ? AND status = 'SOLD'", sellerId);
        int activeAds = DatabaseHelper.count("PRODUCT", "seller_id = ? AND status = 'AVAILABLE'", sellerId);

        // Calculate average rating from reviews
        double avgRating = calculateAverageRating(sellerId);
        int reviewCount = DatabaseHelper.count("REVIEW", "seller_id = ?", sellerId);

        // Get reviews with reviewer info
        List<Map<String, Object>> reviews = getSellerReviews(sellerId);

        // Set attributes
        request.setAttribute("seller", seller);
        request.setAttribute("products", products);
        request.setAttribute("itemsSold", itemsSold);
        request.setAttribute("activeAds", activeAds);
        request.setAttribute("avgRating", avgRating);
        request.setAttribute("reviewCount", reviewCount);
        request.setAttribute("reviews", reviews);
        request.setAttribute("sellerId", sellerId);

        request.getRequestDispatcher("/sellerProfile.jsp").forward(request, response);
    }

    private User getSellerById(String sellerId) {
        String sql = "SELECT * FROM APP.USERS WHERE user_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, sellerId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getString("user_id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setUniversity(rs.getString("university"));
                    user.setStudentIdNumber(rs.getString("student_id_number"));
                    user.setProfileImage(rs.getString("profile_image"));
                    user.setCreatedAt(rs.getTimestamp("created_at"));
                    user.setRating(rs.getDouble("rating"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    private List<Product> getSellerProducts(String sellerId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM APP.PRODUCT WHERE seller_id = ? AND status = 'AVAILABLE' ORDER BY listed_at DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, sellerId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getString("product_id"));
                    p.setSellerId(rs.getString("seller_id"));
                    p.setCategoryId(rs.getString("category_id"));
                    p.setName(rs.getString("name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getDouble("price"));
                    p.setCondition(rs.getString("condition"));
                    p.setStatus(rs.getString("status"));
                    p.setImageUrl(rs.getString("image_url"));
                    p.setListedAt(rs.getTimestamp("listed_at"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    private double calculateAverageRating(String sellerId) {
        String sql = "SELECT AVG(CAST(rating AS DOUBLE)) as avg_rating FROM APP.REVIEW WHERE seller_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, sellerId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    double avg = rs.getDouble("avg_rating");
                    if (!rs.wasNull()) {
                        return Math.round(avg * 10.0) / 10.0; // Round to 1 decimal
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0.0;
    }

    private List<Map<String, Object>> getSellerReviews(String sellerId) {
        List<Map<String, Object>> reviews = new ArrayList<>();
        String sql = "SELECT r.*, u.name as reviewer_name " +
                "FROM APP.REVIEW r " +
                "JOIN APP.USERS u ON r.reviewer_id = u.user_id " +
                "WHERE r.seller_id = ? " +
                "ORDER BY r.created_at DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, sellerId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> review = new HashMap<>();
                    review.put("reviewId", rs.getString("review_id"));
                    review.put("reviewerName", rs.getString("reviewer_name"));
                    review.put("rating", rs.getInt("rating"));
                    review.put("comment", rs.getString("comment"));
                    review.put("createdAt", rs.getTimestamp("created_at"));
                    reviews.add(review);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviews;
    }
}
