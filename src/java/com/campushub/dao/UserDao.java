package com.campushub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import com.campushub.bean.User;
import com.campushub.util.DatabaseHelper;

/**
 * Data Access Object for User operations.
 */
public class UserDao {

    /**
     * Authenticate user by email and password.
     * 
     * @param email    User email
     * @param password User password
     * @return User object if authenticated, null otherwise
     */
    public User authenticateUser(String email, String password) {
        String sql = "SELECT * FROM APP.USERS WHERE email = ? AND password = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Register a new user.
     * 
     * @param user User object with name, email, password, phone, university
     * @return true if successful, false otherwise
     */
    public boolean registerUser(User user) {
        String sql = "INSERT INTO APP.USERS (user_id, name, email, password, phone, university) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String userId = "u" + UUID.randomUUID().toString().substring(0, 8);

            pstmt.setString(1, userId);
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPassword());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getUniversity());

            int rows = pstmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get user by ID.
     * 
     * @param userId User ID
     * @return User object or null
     */
    public User getUserById(String userId) {
        String sql = "SELECT * FROM APP.USERS WHERE user_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get user by email.
     * 
     * @param email User email
     * @return User object or null
     */
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM APP.USERS WHERE email = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Update user profile.
     * 
     * @param user User object with updated fields
     * @return true if successful
     */
    public boolean updateUser(User user) {
        String sql = "UPDATE APP.USERS SET name = ?, phone = ?, university = ? WHERE user_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPhone());
            pstmt.setString(3, user.getUniversity());
            pstmt.setString(4, user.getUserId());

            int rows = pstmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update user password (for forgot password).
     * 
     * @param email       User email
     * @param newPassword New password
     * @return true if successful
     */
    public boolean updatePassword(String email, String newPassword) {
        String sql = "UPDATE APP.USERS SET password = ? WHERE email = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);

            int rows = pstmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Check if email exists.
     * 
     * @param email User email
     * @return true if exists
     */
    public boolean emailExists(String email) {
        return DatabaseHelper.count("USERS", "email = ?", email) > 0;
    }

    /**
     * Helper method to map ResultSet to User object.
     */
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getString("user_id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setPhone(rs.getString("phone"));
        user.setUniversity(rs.getString("university"));
        user.setStudentIdNumber(rs.getString("student_id_number"));
        user.setProfileImage(rs.getString("profile_image"));
        user.setCreatedAt(rs.getTimestamp("created_at"));
        user.setRating(rs.getDouble("rating"));
        return user;
    }
}
