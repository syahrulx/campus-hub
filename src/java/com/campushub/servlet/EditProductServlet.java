package com.campushub.servlet;

import com.campushub.bean.Product;
import com.campushub.util.DatabaseHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet("/editProduct")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10
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

        if (productId == null || productId.trim().isEmpty()) {
            response.sendRedirect("sellerListings");
            return;
        }

        Product product = getProductById(productId.trim());
        if (product == null || product.getSellerId() == null || !product.getSellerId().equals(userId)) {
            response.sendRedirect("sellerListings?error=Unauthorized");
            return;
        }

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

        if (productId == null || productId.trim().isEmpty()) {
            response.sendRedirect("sellerListings");
            return;
        }
        productId = productId.trim();

        Product existing = getProductById(productId);
        if (existing == null || existing.getSellerId() == null || !existing.getSellerId().equals(userId)) {
            response.sendRedirect("sellerListings?error=Unauthorized");
            return;
        }

        if ("delete".equals(action)) {
            boolean deleted = deleteProduct(productId);
            if (deleted) {
                response.sendRedirect("sellerListings?success=Product deleted successfully");
            } else {
                response.sendRedirect("sellerListings?error=Failed to delete product");
            }
            return;
        }

        // Update
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String categoryId = request.getParameter("categoryId");
        String condition = request.getParameter("condition");
        String quantityStr = request.getParameter("quantity");

        int quantity = 1;
        try {
            quantity = Integer.parseInt(quantityStr);
            if (quantity < 1) quantity = 1;
        } catch (Exception ignore) {
            quantity = 1;
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

        // Image (optional)
        String imageUrl = existing.getImageUrl();
        Part filePart = request.getPart("imageFile");
        if (filePart != null && filePart.getSize() > 0) {
            imageUrl = toDataUri(filePart);
        }

        boolean success = updateProduct(productId, categoryId, name, description, price, condition, quantity, imageUrl);

        if (success) {
            response.sendRedirect("sellerListings?success=Product updated successfully");
        } else {
            request.setAttribute("error", "Failed to update product");
            // reload fresh product values for display
            Product refreshed = getProductById(productId);
            request.setAttribute("product", refreshed != null ? refreshed : existing);
            request.setAttribute("categories", getCategories());
            request.getRequestDispatcher("/editProduct.jsp").forward(request, response);
        }
    }

    private String toDataUri(Part filePart) throws IOException {
        String mimeType = filePart.getContentType();
        if (mimeType == null || mimeType.trim().isEmpty()) mimeType = "image/jpeg";

        InputStream input = null;
        try {
            input = filePart.getInputStream();
            java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream();
            byte[] data = new byte[16384];
            int nRead;
            while ((nRead = input.read(data)) != -1) {
                buffer.write(data, 0, nRead);
            }
            String base64 = Base64.getEncoder().encodeToString(buffer.toByteArray());
            return "data:" + mimeType + ";base64," + base64;
        } finally {
            if (input != null) try { input.close(); } catch (IOException ignore) {}
        }
    }

    private Product getProductById(String productId) {
        String sql = "SELECT * FROM APP.PRODUCT WHERE PRODUCT_ID = ?";
        try (Connection conn = DatabaseHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, productId);

            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;

                Product p = new Product();
                p.setProductId(rs.getString("PRODUCT_ID"));
                p.setSellerId(rs.getString("SELLER_ID"));
                p.setCategoryId(rs.getString("CATEGORY_ID"));
                p.setName(rs.getString("NAME"));
                p.setDescription(rs.getString("DESCRIPTION"));
                p.setPrice(rs.getDouble("PRICE"));
                p.setCondition(rs.getString("condition")); // keep if your column is quoted as "condition"
                p.setStatus(rs.getString("STATUS"));
                p.setQuantity(rs.getInt("QUANTITY"));
                p.setImageUrl(rs.getString("IMAGE_URL"));
                p.setListedAt(rs.getTimestamp("LISTED_AT"));
                return p;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    private List<String[]> getCategories() {
        List<String[]> categories = new ArrayList<>();
        String sql = "SELECT CATEGORY_ID, NAME FROM APP.CATEGORY";
        try (Connection conn = DatabaseHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                categories.add(new String[]{rs.getString("CATEGORY_ID"), rs.getString("NAME")});
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    private boolean updateProduct(String productId, String categoryId, String name,
                                  String description, double price, String condition,
                                  int quantity, String imageUrl) {

        String sql = "UPDATE APP.PRODUCT " +
                     "SET CATEGORY_ID = ?, NAME = ?, DESCRIPTION = ?, PRICE = ?, \"condition\" = ?, QUANTITY = ?, IMAGE_URL = ? " +
                     "WHERE PRODUCT_ID = ?";

        try (Connection conn = DatabaseHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, categoryId);
            ps.setString(2, name);
            ps.setString(3, description);
            ps.setDouble(4, price);
            ps.setString(5, condition);
            ps.setInt(6, quantity);
            ps.setString(7, imageUrl);
            ps.setString(8, productId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean deleteProduct(String productId) {
        String deleteCartItems = "DELETE FROM APP.CART_ITEM WHERE PRODUCT_ID = ?";
        String deleteMessages  = "DELETE FROM APP.MESSAGE WHERE PRODUCT_ID = ?";
        String deleteOrders    = "DELETE FROM APP.ORDERS WHERE PRODUCT_ID = ?";
        String deleteProduct   = "DELETE FROM APP.PRODUCT WHERE PRODUCT_ID = ?";

        try (Connection conn = DatabaseHelper.getConnection()) {
            conn.setAutoCommit(false);

            try (PreparedStatement psCart = conn.prepareStatement(deleteCartItems);
                 PreparedStatement psMsg = conn.prepareStatement(deleteMessages);
                 PreparedStatement psOrders = conn.prepareStatement(deleteOrders);
                 PreparedStatement psProduct = conn.prepareStatement(deleteProduct)) {

                psCart.setString(1, productId);
                psCart.executeUpdate();

                psMsg.setString(1, productId);
                psMsg.executeUpdate();

                psOrders.setString(1, productId);
                psOrders.executeUpdate();

                psProduct.setString(1, productId);
                int rowsDeleted = psProduct.executeUpdate();

                conn.commit();
                return rowsDeleted > 0;

            } catch (SQLException e) {
                conn.rollback();
                e.printStackTrace();
                return false;
            } finally {
                conn.setAutoCommit(true);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}