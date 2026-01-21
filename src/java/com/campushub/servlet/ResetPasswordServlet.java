/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.campushub.servlet;

import com.campushub.dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = (String) session.getAttribute("userId");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (currentPassword == null || currentPassword.isEmpty()
                || newPassword == null || newPassword.isEmpty()
                || confirmPassword == null || confirmPassword.isEmpty()) {
            response.sendRedirect("editProfile?pwError=All fields are required");
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("editProfile?pwError=New password and confirmation do not match");
            return;
        }

        if (newPassword.length() < 8) {
            response.sendRedirect("editProfile?pwError=New password must be at least 8 characters");
            return;
        }

        if (!userDao.checkPassword(userId, currentPassword)) {
            response.sendRedirect("editProfile?pwError=Current password is incorrect");
            return;
        }

        boolean updated = userDao.updatePassword(userId, newPassword);
        if (updated) {
            response.sendRedirect("editProfile?pwSuccess=Password updated successfully");
        } else {
            response.sendRedirect("editProfile?pwError=Failed to update password");
        }
    }
}