package com.campushub.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.bean.User;
import com.campushub.dao.UserDao;

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = (String) session.getAttribute("userId");
        User user = userDao.getUserById(userId);

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
            request.setAttribute("user", userDao.getUserById(userId));
            request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setUserId(userId);
        user.setName(name.trim());
        user.setPhone(phone);
        user.setUniversity(university);

        boolean success = userDao.updateUser(user);

        if (success) {
            // Update session with new name
            session.setAttribute("userName", name.trim());
            response.sendRedirect("profile?success=Profile updated successfully");
        } else {
            request.setAttribute("error", "Failed to update profile");
            request.setAttribute("user", userDao.getUserById(userId));
            request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
        }
    }
}
