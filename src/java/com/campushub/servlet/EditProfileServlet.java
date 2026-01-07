package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.bean.User;
import com.campushub.util.DatabaseHelper;

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {
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
        User user = getUserById(userId);

        if (user == null) {
            response.sendRedirect("profile");
            return;
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = (String) session.getAttribute("userId");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String university = request.getParameter("university");

        // Validate inputs
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "Name is required");
            request.setAttribute("user", getUserById(userId));
            request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
            return;
        }

        boolean success = updateUser(userId, name.trim(), phone, university);

        if (success) {
            // Update session with new name
            session.setAttribute("userName", name.trim());
            response.sendRedirect("profile?success=Profile updated successfully");
        } else {
            request.setAttribute("error", "Failed to update profile");
            request.setAttribute("user", getUserById(userId));
            request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
        }
    }

    private User getUserById(String userId) {
        String sql = "SELECT * FROM APP.USERS WHERE user_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setUserId(rs.getString("user_id"));
                    u.setName(rs.getString("name"));
                    u.setEmail(rs.getString("email"));
                    u.setPhone(rs.getString("phone"));
                    u.setUniversity(rs.getString("university"));
                    u.setCreatedAt(rs.getTimestamp("created_at"));
                    return u;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private boolean updateUser(String userId, String name, String phone, String university) {
        String sql = "UPDATE APP.USERS SET name = ?, phone = ?, university = ? WHERE user_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, phone);
            pstmt.setString(3, university);
            pstmt.setString(4, userId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
