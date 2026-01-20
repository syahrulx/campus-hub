package com.campushub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import com.campushub.util.DatabaseHelper;

/**
 * Data Access Object for Review operations.
 */
public class ReviewDao {

    /**
     * Get reviews for a seller.
     */
    public List<Object[]> getReviewsBySeller(String sellerId) {
        List<Object[]> reviews = new ArrayList<>();
        String sql = "SELECT r.review_id, r.rating, r.comment, r.created_at, " +
                "u.name as reviewer_name " +
                "FROM APP.REVIEW r " +
                "JOIN APP.USERS u ON r.reviewer_id = u.user_id " +
                "WHERE r.seller_id = ? " +
                "ORDER BY r.created_at DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sellerId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    reviews.add(new Object[] {
                            rs.getString("review_id"),
                            rs.getInt("rating"),
                            rs.getString("comment"),
                            rs.getTimestamp("created_at"),
                            rs.getString("reviewer_name")
                    });
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    /**
     * Add a review.
     */
    public boolean addReview(String reviewerId, String sellerId, String orderId, int rating, String comment) {
        String sql = "INSERT INTO APP.REVIEW (review_id, reviewer_id, seller_id, order_id, rating, comment) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "rev" + UUID.randomUUID().toString().substring(0, 8));
            ps.setString(2, reviewerId);
            ps.setString(3, sellerId);
            ps.setString(4, orderId);
            ps.setInt(5, rating);
            ps.setString(6, comment);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Check if user has already reviewed an order.
     */
    public boolean hasReviewedOrder(String orderId) {
        String sql = "SELECT 1 FROM APP.REVIEW WHERE order_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, orderId);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Get average rating for a seller.
     */
    public double getAverageRating(String sellerId) {
        String sql = "SELECT AVG(CAST(rating AS DOUBLE)) as avg_rating FROM APP.REVIEW WHERE seller_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sellerId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("avg_rating");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    /**
     * Get review count for a seller.
     */
    public int getReviewCount(String sellerId) {
        return DatabaseHelper.count("REVIEW", "seller_id = ?", sellerId);
    }
}
