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
import com.campushub.bean.Product;
import com.campushub.util.DatabaseHelper;

@WebServlet("/sellerListings")
public class SellerListingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String sellerId = (String) session.getAttribute("userId");

        // Get seller's products
        List<Product> listings = getSellerProducts(sellerId);
        request.setAttribute("sellerListings", listings);

        // Get stats
        int activeCount = DatabaseHelper.count("PRODUCT", "seller_id = ? AND status = 'AVAILABLE'", sellerId);
        int soldCount = DatabaseHelper.count("PRODUCT", "seller_id = ? AND status = 'SOLD'", sellerId);
        double totalEarnings = DatabaseHelper.sum("ORDERS", "total_amount", "seller_id = ? AND status = 'COMPLETED'",
                sellerId);
        int pendingOrders = DatabaseHelper.count("ORDERS", "seller_id = ? AND status = 'PENDING'", sellerId);

        request.setAttribute("activeCount", activeCount);
        request.setAttribute("soldCount", soldCount);
        request.setAttribute("totalEarnings", totalEarnings);
        request.setAttribute("pendingOrders", pendingOrders);

        request.getRequestDispatcher("/sellerListings.jsp").forward(request, response);
    }

    private List<Product> getSellerProducts(String sellerId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM APP.PRODUCT WHERE seller_id = ? ORDER BY listed_at DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, sellerId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getString("product_id"));
                    p.setSellerId(rs.getString("seller_id"));
                    p.setCategoryId(rs.getString("category_id"));
                    p.setName(rs.getString("name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getDouble("price"));
                    p.setCondition(rs.getString("condition"));
                    p.setStatus(rs.getString("status"));
                    p.setImageUrl(rs.getString("image_url"));
                    p.setQuantity(rs.getInt("quantity"));
                    p.setListedAt(rs.getTimestamp("listed_at"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }
}
