package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.campushub.util.DatabaseHelper;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        if (email != null && !email.isEmpty()) {
            if (userExists(email)) {
                // Generate a temporary password (simple implementation)
                String tempPassword = "temp" + UUID.randomUUID().toString().substring(0, 5);

                // Update password in database
                if (updatePassword(email, tempPassword)) {
                    // Simulation of sending email (Since we don't have SMTP server)
                    request.setAttribute("successMessage",
                            "Password reset successful! Temporary password: " + tempPassword);
                } else {
                    request.setAttribute("errorMessage", "Error updating password. Please try again.");
                }
            } else {
                request.setAttribute("errorMessage", "Email address not found.");
            }
        } else {
            request.setAttribute("errorMessage", "Please enter your email.");
        }

        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    private boolean userExists(String email) {
        return DatabaseHelper.count("USERS", "email = ?", email) > 0;
    }

    private boolean updatePassword(String email, String newPassword) {
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
}
