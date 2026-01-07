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
import com.campushub.bean.Product;
import com.campushub.bean.User;
import com.campushub.util.DatabaseHelper;

@WebServlet("/productDetail")
public class ProductDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productId = request.getParameter("id");
        if (productId == null || productId.isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        // Get product details
        Product product = getProductById(productId);
        if (product == null) {
            response.sendRedirect("products");
            return;
        }

        // Get seller info
        User seller = getSellerById(product.getSellerId());

        // Get related products (same category, exclude current)
        List<Product> relatedProducts = getRelatedProducts(product.getCategoryId(), productId);

        // Get category name
        String categoryName = getCategoryName(product.getCategoryId());

        request.setAttribute("product", product);
        request.setAttribute("seller", seller);
        request.setAttribute("relatedProducts", relatedProducts);
        request.setAttribute("categoryName", categoryName);

        request.getRequestDispatcher("/productDetail.jsp").forward(request, response);
    }

    private Product getProductById(String productId) {
        String sql = "SELECT * FROM APP.PRODUCT WHERE product_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, productId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
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
                    p.setListedAt(rs.getTimestamp("listed_at"));
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private User getSellerById(String sellerId) {
        String sql = "SELECT * FROM APP.USERS WHERE user_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, sellerId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setUserId(rs.getString("user_id"));
                    u.setName(rs.getString("name"));
                    u.setEmail(rs.getString("email"));
                    u.setUniversity(rs.getString("university"));
                    u.setRating(rs.getDouble("rating"));
                    u.setCreatedAt(rs.getTimestamp("created_at"));
                    return u;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private List<Product> getRelatedProducts(String categoryId, String excludeProductId) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM APP.PRODUCT WHERE category_id = ? AND product_id != ? AND status = 'AVAILABLE' FETCH FIRST 4 ROWS ONLY";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, categoryId);
            pstmt.setString(2, excludeProductId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getString("product_id"));
                    p.setName(rs.getString("name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getDouble("price"));
                    p.setImageUrl(rs.getString("image_url"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    private String getCategoryName(String categoryId) {
        String sql = "SELECT name FROM APP.CATEGORY WHERE category_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, categoryId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Unknown";
    }
}
