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
import com.campushub.util.DatabaseHelper;

@WebServlet("/orderDetail")
public class OrderDetailServlet extends HttpServlet {
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
        String orderId = request.getParameter("id");

        if (orderId == null || orderId.isEmpty()) {
            response.sendRedirect("orders");
            return;
        }

        // Get order details
        Object[] orderData = getOrderDetails(orderId, userId);

        if (orderData == null) {
            response.sendRedirect("orders");
            return;
        }

        request.setAttribute("order", orderData);
        request.getRequestDispatcher("/orderTracking.jsp").forward(request, response);
    }

    private Object[] getOrderDetails(String orderId, String userId) {
        String sql = "SELECT o.order_id, o.quantity, o.total_amount, o.status, o.ordered_at, " +
                "p.name, p.image_url, p.product_id, p.price, p.description, " +
                "seller.name as seller_name, seller.email as seller_email, seller.phone as seller_phone, " +
                "buyer.name as buyer_name " +
                "FROM APP.ORDERS o " +
                "JOIN APP.PRODUCT p ON o.product_id = p.product_id " +
                "JOIN APP.USERS seller ON o.seller_id = seller.user_id " +
                "JOIN APP.USERS buyer ON o.buyer_id = buyer.user_id " +
                "WHERE o.order_id = ? AND (o.buyer_id = ? OR o.seller_id = ?)";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, orderId);
            pstmt.setString(2, userId);
            pstmt.setString(3, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Object[] order = new Object[14];
                    order[0] = rs.getString("order_id");
                    order[1] = rs.getString("name"); // product name
                    order[2] = rs.getInt("quantity");
                    order[3] = rs.getDouble("total_amount");
                    order[4] = rs.getString("status");
                    order[5] = rs.getTimestamp("ordered_at");
                    order[6] = rs.getString("image_url");
                    order[7] = rs.getString("product_id");
                    order[8] = rs.getDouble("price");
                    order[9] = rs.getString("description");
                    order[10] = rs.getString("seller_name");
                    order[11] = rs.getString("seller_email");
                    order[12] = rs.getString("seller_phone");
                    order[13] = rs.getString("buyer_name");
                    return order;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
