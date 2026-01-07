package com.campushub.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.bean.User;
import com.campushub.util.DatabaseHelper;

@WebServlet("/profile")
public class UserProfileServlet extends HttpServlet {
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
        User user = (User) session.getAttribute("user");

        // Get stats
        int itemsSold = DatabaseHelper.count("PRODUCT", "seller_id = ? AND status = 'SOLD'", userId);
        int activeListings = DatabaseHelper.count("PRODUCT", "seller_id = ? AND status = 'AVAILABLE'", userId);
        int purchases = DatabaseHelper.count("ORDERS", "buyer_id = ?", userId);

        request.setAttribute("user", user);
        request.setAttribute("itemsSold", itemsSold);
        request.setAttribute("activeListings", activeListings);
        request.setAttribute("purchases", purchases);

        request.getRequestDispatcher("/userProfile.jsp").forward(request, response);
    }
}
