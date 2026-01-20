package com.campushub.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.dao.OrderDao;

@WebServlet("/orderDetail")
public class OrderDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String orderId = request.getParameter("id");

        if (orderId == null || orderId.isEmpty()) {
            response.sendRedirect("orders");
            return;
        }

        // Get order details using DAO
        Object[] orderData = orderDao.getOrderById(orderId);

        if (orderData == null) {
            response.sendRedirect("orders");
            return;
        }

        request.setAttribute("order", orderData);
        request.getRequestDispatcher("/orderTracking.jsp").forward(request, response);
    }
}
