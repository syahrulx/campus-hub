package com.campushub.servlet;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.campushub.dao.UserDao;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao = new UserDao();

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
            if (userDao.emailExists(email)) {
                // Generate a temporary password
                String tempPassword = "temp" + UUID.randomUUID().toString().substring(0, 5);

                // Update password in database
                if (userDao.updatePasswordByEmail(email, tempPassword)) {
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
}
