package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.util.DatabaseHelper;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {
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

        // Get buyer's orders
        List<Object[]> orders = getUserOrders(userId);
        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/orderDetails.jsp").forward(request, response);
    }

    private List<Object[]> getUserOrders(String buyerId) {
        List<Object[]> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.quantity, o.total_amount, o.status, o.ordered_at, " +
                "p.name, p.image_url " +
                "FROM APP.ORDERS o " +
                "JOIN APP.PRODUCT p ON o.product_id = p.product_id " +
                "WHERE o.buyer_id = ? ORDER BY o.ordered_at DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, buyerId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Object[] order = new Object[7];
                    order[0] = rs.getString("order_id");
                    order[1] = rs.getString("name");
                    order[2] = rs.getInt("quantity");
                    order[3] = rs.getDouble("total_amount");
                    order[4] = rs.getString("status");
                    order[5] = rs.getTimestamp("ordered_at");
                    order[6] = rs.getString("image_url");
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }
}
