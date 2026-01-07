package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.util.DatabaseHelper;

@WebServlet("/messages")
public class MessageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = (String) session.getAttribute("userId");
        String conversationWith = request.getParameter("with");

        // Get all conversations for this user
        List<Map<String, Object>> conversations = getConversations(userId);
        request.setAttribute("conversations", conversations);

        // If a specific conversation is selected, load messages
        if (conversationWith != null && !conversationWith.isEmpty()) {
            List<Map<String, Object>> messages = getMessages(userId, conversationWith);
            Map<String, Object> otherUser = getUserInfo(conversationWith);
            request.setAttribute("messages", messages);
            request.setAttribute("chatWith", otherUser);
            request.setAttribute("chatWithId", conversationWith);

            // Mark messages as read
            markAsRead(userId, conversationWith);
        } else if (!conversations.isEmpty()) {
            // Default to first conversation
            String firstConvoId = (String) conversations.get(0).get("userId");
            List<Map<String, Object>> messages = getMessages(userId, firstConvoId);
            Map<String, Object> otherUser = getUserInfo(firstConvoId);
            request.setAttribute("messages", messages);
            request.setAttribute("chatWith", otherUser);
            request.setAttribute("chatWithId", firstConvoId);
            markAsRead(userId, firstConvoId);
        }

        request.getRequestDispatcher("/messages.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String senderId = (String) session.getAttribute("userId");
        String receiverId = request.getParameter("receiverId");
        String content = request.getParameter("content");
        String productId = request.getParameter("productId");

        if (receiverId != null && content != null && !content.trim().isEmpty()) {
            sendMessage(senderId, receiverId, content, productId);
        }

        response.sendRedirect("messages?with=" + receiverId);
    }

    private List<Map<String, Object>> getConversations(String userId) {
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
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            pstmt.setString(2, userId);
            pstmt.setString(3, userId);
            pstmt.setString(4, userId);
            pstmt.setString(5, userId);
            pstmt.setString(6, userId);
            pstmt.setString(7, userId);
            pstmt.setString(8, userId);
            pstmt.setString(9, userId);
            pstmt.setString(10, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
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

    private List<Map<String, Object>> getMessages(String userId, String otherUserId) {
        List<Map<String, Object>> messages = new ArrayList<>();
        String sql = "SELECT m.*, u.name as sender_name FROM APP.MESSAGE m " +
                "JOIN APP.USERS u ON m.sender_id = u.user_id " +
                "WHERE (m.sender_id = ? AND m.receiver_id = ?) OR (m.sender_id = ? AND m.receiver_id = ?) " +
                "ORDER BY m.sent_at ASC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            pstmt.setString(2, otherUserId);
            pstmt.setString(3, otherUserId);
            pstmt.setString(4, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
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

    private Map<String, Object> getUserInfo(String userId) {
        Map<String, Object> user = new HashMap<>();
        String sql = "SELECT name, email FROM APP.USERS WHERE user_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
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

    private void sendMessage(String senderId, String receiverId, String content, String productId) {
        String sql = "INSERT INTO APP.MESSAGE (message_id, sender_id, receiver_id, product_id, content) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "msg" + UUID.randomUUID().toString().substring(0, 8));
            pstmt.setString(2, senderId);
            pstmt.setString(3, receiverId);
            pstmt.setString(4, productId);
            pstmt.setString(5, content);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void markAsRead(String receiverId, String senderId) {
        String sql = "UPDATE APP.MESSAGE SET is_read = true WHERE receiver_id = ? AND sender_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, receiverId);
            pstmt.setString(2, senderId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
