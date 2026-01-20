package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.bean.CartItem;
import com.campushub.bean.Product;
import com.campushub.util.DatabaseHelper;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
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

        // Get cart items for order summary
        List<CartItem> cartItems = getCartItems(userId);
        if (cartItems.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        double subtotal = 0;
        for (CartItem item : cartItems) {
            subtotal += item.getProduct().getPrice() * item.getQuantity();
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("subtotal", subtotal);
        request.setAttribute("total", subtotal); // No shipping for campus marketplace
        request.getRequestDispatcher("/payment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");
        String bankCode = request.getParameter("bankCode");

        if (paymentMethod == null || paymentMethod.trim().isEmpty()) {
            request.setAttribute("error", "Please select a payment method");
            doGet(request, response);
            return;
        }

        // FPX must select a bank
        if ("FPX".equals(paymentMethod) && (bankCode == null || bankCode.trim().isEmpty())) {
            request.setAttribute("error", "Please select a bank for FPX");
            doGet(request, response);
            return;
        }

        // Store in session (source of truth)
        session.setAttribute("paymentMethod", paymentMethod);
        session.setAttribute("bankCode", bankCode);
        session.setAttribute("paymentId", "PAY" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());

        response.sendRedirect("paymentProcessing.jsp");
    }

    private List<CartItem> getCartItems(String userId) {
        List<CartItem> items = new ArrayList<>();
        String sql = "SELECT ci.*, p.*, u.name as seller_name FROM APP.CART_ITEM ci " +
                "JOIN APP.CART c ON ci.cart_id = c.cart_id " +
                "JOIN APP.PRODUCT p ON ci.product_id = p.product_id " +
                "JOIN APP.USERS u ON p.seller_id = u.user_id " +
                "WHERE c.user_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    CartItem item = new CartItem();
                    item.setCartItemId(rs.getString("cart_item_id"));
                    item.setCartId(rs.getString("cart_id"));
                    item.setProductId(rs.getString("product_id"));
                    item.setQuantity(rs.getInt("quantity"));

                    Product p = new Product();
                    p.setProductId(rs.getString("product_id"));
                    p.setName(rs.getString("name"));
                    p.setPrice(rs.getDouble("price"));
                    p.setImageUrl(rs.getString("image_url"));
                    p.setSellerId(rs.getString("seller_id"));
                    p.setSellerName(rs.getString("seller_name"));
                    item.setProduct(p);

                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }
}
