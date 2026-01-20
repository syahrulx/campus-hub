package com.campushub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import com.campushub.util.DatabaseHelper;

/**
 * Data Access Object for Message operations.
 */
public class MessageDao {

    /**
     * Get conversation list for a user.
     */
    public List<Map<String, Object>> getConversations(String userId) {
        List<Map<String, Object>> conversations = new ArrayList<>();

        // Get unique users this user has conversed with
        String sql = "SELECT DISTINCT " +
                "CASE WHEN m.sender_id = ? THEN m.receiver_id ELSE m.sender_id END as other_user_id, " +
                "u.name as other_user_name, " +
                "(SELECT content FROM APP.MESSAGE m2 WHERE " +
                "  ((m2.sender_id = ? AND m2.receiver_id = CASE WHEN m.sender_id = ? THEN m.receiver_id ELSE m.sender_id END) OR "
                +
                "   (m2.receiver_id = ? AND m2.sender_id = CASE WHEN m.sender_id = ? THEN m.receiver_id ELSE m.sender_id END)) "
                +
                "  ORDER BY m2.sent_at DESC FETCH FIRST 1 ROW ONLY) as last_message, " +
                "(SELECT COUNT(*) FROM APP.MESSAGE m3 WHERE m3.sender_id = CASE WHEN m.sender_id = ? THEN m.receiver_id ELSE m.sender_id END "
                +
                "  AND m3.receiver_id = ? AND m3.is_read = false) as unread_count " +
                "FROM APP.MESSAGE m " +
                "JOIN APP.USERS u ON u.user_id = CASE WHEN m.sender_id = ? THEN m.receiver_id ELSE m.sender_id END " +
                "WHERE m.sender_id = ? OR m.receiver_id = ? " +
                "ORDER BY unread_count DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            ps.setString(2, userId);
            ps.setString(3, userId);
            ps.setString(4, userId);
            ps.setString(5, userId);
            ps.setString(6, userId);
            ps.setString(7, userId);
            ps.setString(8, userId);
            ps.setString(9, userId);
            ps.setString(10, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> convo = new HashMap<>();
                    convo.put("userId", rs.getString("other_user_id"));
                    convo.put("userName", rs.getString("other_user_name"));
                    convo.put("lastMessage", rs.getString("last_message"));
                    convo.put("unreadCount", rs.getInt("unread_count"));
                    conversations.add(convo);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conversations;
    }

    /**
     * Get messages between two users.
     */
    public List<Map<String, Object>> getMessages(String userId, String otherUserId) {
        List<Map<String, Object>> messages = new ArrayList<>();
        String sql = "SELECT m.*, u.name as sender_name FROM APP.MESSAGE m " +
                "JOIN APP.USERS u ON m.sender_id = u.user_id " +
                "WHERE (m.sender_id = ? AND m.receiver_id = ?) OR (m.sender_id = ? AND m.receiver_id = ?) " +
                "ORDER BY m.sent_at ASC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            ps.setString(2, otherUserId);
            ps.setString(3, otherUserId);
            ps.setString(4, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> msg = new HashMap<>();
                    msg.put("messageId", rs.getString("message_id"));
                    msg.put("senderId", rs.getString("sender_id"));
                    msg.put("senderName", rs.getString("sender_name"));
                    msg.put("content", rs.getString("content"));
                    msg.put("sentAt", rs.getTimestamp("sent_at"));
                    msg.put("isMine", rs.getString("sender_id").equals(userId));
                    messages.add(msg);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    /**
     * Send a message.
     */
    public boolean sendMessage(String senderId, String receiverId, String content, String productId) {
        String sql = "INSERT INTO APP.MESSAGE (message_id, sender_id, receiver_id, product_id, content) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "msg" + UUID.randomUUID().toString().substring(0, 8));
            ps.setString(2, senderId);
            ps.setString(3, receiverId);
            ps.setString(4, productId);
            ps.setString(5, content);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Mark messages as read.
     */
    public void markAsRead(String receiverId, String senderId) {
        String sql = "UPDATE APP.MESSAGE SET is_read = true WHERE receiver_id = ? AND sender_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, receiverId);
            ps.setString(2, senderId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Get user info for chat.
     */
    public Map<String, Object> getUserInfo(String userId) {
        Map<String, Object> user = new HashMap<>();
        String sql = "SELECT name, email FROM APP.USERS WHERE user_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user.put("name", rs.getString("name"));
                    user.put("email", rs.getString("email"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    /**
     * Delete conversation between two users.
     */
    public boolean deleteConversation(String userId, String otherUserId) {
        String sql = "DELETE FROM APP.MESSAGE WHERE " +
                "(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            ps.setString(2, otherUserId);
            ps.setString(3, otherUserId);
            ps.setString(4, userId);
            return ps.executeUpdate() >= 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
