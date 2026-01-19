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
import javax.servlet.annotation.MultipartConfig;
import com.campushub.bean.Product;
import com.campushub.util.DatabaseHelper;

@WebServlet("/editProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
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

            String imageUrl = existing.getImageUrl();
            javax.servlet.http.Part filePart = request.getPart("imageFile");
            if (filePart != null && filePart.getSize() > 0) {
                try (java.io.InputStream input = filePart.getInputStream()) {
                    java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream();
                    int nRead;
                    byte[] data = new byte[16384];
                    while ((nRead = input.read(data, 0, data.length)) != -1) {
                        buffer.write(data, 0, nRead);
                    }
                    byte[] imageBytes = buffer.toByteArray();
                    String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
                    String mimeType = filePart.getContentType();
                    if (mimeType == null) {
                        mimeType = "image/jpeg";
                    }
                    imageUrl = "data:" + mimeType + ";base64," + base64Image;
                }
            }

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

    private boolean deleteProduct(String productId) {
        String deleteCartItems = "DELETE FROM APP.CART_ITEM WHERE PRODUCT_ID = ?";
        String deleteMessages = "DELETE FROM APP.MESSAGE WHERE PRODUCT_ID = ?";
        String deleteOrders = "DELETE FROM APP.ORDERS WHERE PRODUCT_ID = ?";
        String deleteProduct = "DELETE FROM APP.PRODUCT WHERE PRODUCT_ID = ?";

        try (Connection conn = DatabaseHelper.getConnection()) {
            // Disable auto-commit for transaction
            conn.setAutoCommit(false);

            try (PreparedStatement psCart = conn.prepareStatement(deleteCartItems);
                    PreparedStatement psMsg = conn.prepareStatement(deleteMessages);
                    PreparedStatement psOrders = conn.prepareStatement(deleteOrders);
                    PreparedStatement psProduct = conn.prepareStatement(deleteProduct)) {

                // Delete from Cart_Item
                psCart.setString(1, productId);
                psCart.executeUpdate();

                // Delete from Message
                psMsg.setString(1, productId);
                psMsg.executeUpdate();

                // Delete from Orders
                psOrders.setString(1, productId);
                psOrders.executeUpdate();

                // Finally, delete from Product
                psProduct.setString(1, productId);
                int rowsDeleted = psProduct.executeUpdate();

                // Commit transaction
                conn.commit();

                return rowsDeleted > 0;

            } catch (SQLException e) {
                conn.rollback(); // Rollback if anything fails
                e.printStackTrace();
                return false;
            } finally {
                conn.setAutoCommit(true); // Restore default
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
