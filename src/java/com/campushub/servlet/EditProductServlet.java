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

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String productId = request.getParameter("id");
        String userId = (String) session.getAttribute("userId");

        if (productId == null || productId.isEmpty()) {
            response.sendRedirect("sellerListings");
            return;
        }

        // Load product and verify ownership
        Product product = getProductById(productId);
        if (product == null || !product.getSellerId().equals(userId)) {
            response.sendRedirect("sellerListings?error=Unauthorized");
            return;
        }

        // Load categories for dropdown
        request.setAttribute("product", product);
        request.setAttribute("categories", getCategories());
        request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
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
        String action = request.getParameter("action");
        String productId = request.getParameter("productId");

        // Verify ownership
        Product existing = getProductById(productId);
        if (existing == null || !existing.getSellerId().equals(userId)) {
            response.sendRedirect("sellerListings?error=Unauthorized");
            return;
        }

        if ("delete".equals(action)) {
            deleteProduct(productId);
            response.sendRedirect("sellerListings?success=Product deleted successfully");
        } else {
            // Update product
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String categoryId = request.getParameter("categoryId");
            String condition = request.getParameter("condition");
            String imageUrl = request.getParameter("imageUrl");

            double price;
            try {
                price = Double.parseDouble(priceStr);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid price format");
                request.setAttribute("product", existing);
                request.setAttribute("categories", getCategories());
                request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
                return;
            }

            if (imageUrl == null || imageUrl.trim().isEmpty()) {
                imageUrl = existing.getImageUrl();
            }

            boolean success = updateProduct(productId, categoryId, name, description, price, condition, imageUrl);

            if (success) {
                response.sendRedirect("sellerListings?success=Product updated successfully");
            } else {
                request.setAttribute("error", "Failed to update product");
                request.setAttribute("product", existing);
                request.setAttribute("categories", getCategories());
                request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
            }
        }
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
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private List<String[]> getCategories() {
        List<String[]> categories = new ArrayList<>();
        String sql = "SELECT category_id, name FROM APP.CATEGORY";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                categories.add(new String[] { rs.getString("category_id"), rs.getString("name") });
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    private boolean updateProduct(String productId, String categoryId, String name,
            String description, double price, String condition, String imageUrl) {
        String sql = "UPDATE APP.PRODUCT SET category_id = ?, name = ?, description = ?, price = ?, \"condition\" = ?, image_url = ? WHERE product_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, categoryId);
            pstmt.setString(2, name);
            pstmt.setString(3, description);
            pstmt.setDouble(4, price);
            pstmt.setString(5, condition);
            pstmt.setString(6, imageUrl);
            pstmt.setString(7, productId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private void deleteProduct(String productId) {
        String sql = "DELETE FROM APP.PRODUCT WHERE product_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, productId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
