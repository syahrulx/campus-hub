package com.campushub.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:derby://localhost:1527/campus_db";
    private static final String JDBC_USER = "app";
    private static final String JDBC_PASS = "app";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Load categories for dropdown
        request.setAttribute("categories", getCategories());
        request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String sellerId = (String) session.getAttribute("userId");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String categoryId = request.getParameter("categoryId");
        String condition = request.getParameter("condition");

        // Handle file upload - convert to Base64 data URI
        String imageUrl = "images/product-placeholder.png";
        Part filePart = request.getPart("imageFile");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream input = filePart.getInputStream()) {
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
            request.setAttribute("categories", getCategories());
            request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
            return;
        }

        boolean success = createProduct(sellerId, categoryId, name, description, price, condition, imageUrl);

        if (success) {
            response.sendRedirect("sellerListings.jsp?success=Product added successfully!");
        } else {
            request.setAttribute("error", "Failed to add product. Please try again.");
            request.setAttribute("categories", getCategories());
            request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
        }
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Derby driver not found", e);
        }
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }

    private List<String[]> getCategories() {
        List<String[]> categories = new ArrayList<>();
        String sql = "SELECT category_id, name FROM APP.CATEGORY";

        try (Connection conn = getConnection();
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

    private boolean createProduct(String sellerId, String categoryId, String name,
            String description, double price, String condition, String imageUrl) {
        String sql = "INSERT INTO APP.PRODUCT (product_id, seller_id, category_id, name, description, price, \"condition\", status, image_url) "
                +
                "VALUES (?, ?, ?, ?, ?, ?, ?, 'AVAILABLE', ?)";

        try (Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String productId = "p" + UUID.randomUUID().toString().substring(0, 8);

            pstmt.setString(1, productId);
            pstmt.setString(2, sellerId);
            pstmt.setString(3, categoryId);
            pstmt.setString(4, name);
            pstmt.setString(5, description);
            pstmt.setDouble(6, price);
            pstmt.setString(7, condition);
            pstmt.setString(8, imageUrl);

            int rows = pstmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private String getFileExtension(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String content : contentDisposition.split(";")) {
            if (content.trim().startsWith("filename")) {
                String fileName = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                int dotIndex = fileName.lastIndexOf('.');
                if (dotIndex > 0) {
                    return fileName.substring(dotIndex);
                }
            }
        }
        return ".jpg";
    }
}
