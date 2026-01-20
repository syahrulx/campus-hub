package com.campushub.servlet;

import com.campushub.bean.Product;
import com.campushub.util.DatabaseHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL  = "jdbc:derby://localhost:1527/campus_db";
    private static final String JDBC_USER = "app";
    private static final String JDBC_PASS = "app";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category"); // e.g. c2
        if (category != null) category = category.trim();

        List<Product> productList =
                (category == null || category.isEmpty())
                        ? getAllProducts()
                        : getProductsByCategory(category);

        request.setAttribute("featuredProducts", productList);
        request.setAttribute("selectedCategory", category);
        
        // Get product name
        String sql = "SELECT name FROM category WHERE category_id = ?";
        String categoryName = null;

        try (Connection conn = DatabaseHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    categoryName = rs.getString("name");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MessageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("categoryName", categoryName);

        request.getRequestDispatcher("/viewProducts.jsp").forward(request, response);
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Derby driver not found", e);
        }
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }

    private List<Product> getAllProducts() {
        String sql = "SELECT * FROM APP.PRODUCT " +
                     "WHERE STATUS = 'AVAILABLE' " +
                     "ORDER BY LISTED_AT DESC";

        List<Product> products = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                products.add(mapRowToProduct(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Failed to fetch products", e);
        }

        return products;
    }

    private List<Product> getProductsByCategory(String categoryId) {
        String sql = "SELECT * FROM APP.PRODUCT " +
                     "WHERE STATUS = 'AVAILABLE' AND CATEGORY_ID = ? " +
                     "ORDER BY LISTED_AT DESC";

        List<Product> products = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, categoryId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(mapRowToProduct(rs));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Failed to fetch products by category: " + categoryId, e);
        }

        return products;
    }

    private Product mapRowToProduct(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setProductId(rs.getString("PRODUCT_ID"));
        product.setSellerId(rs.getString("SELLER_ID"));
        product.setCategoryId(rs.getString("CATEGORY_ID"));
        product.setName(rs.getString("NAME"));
        product.setDescription(rs.getString("DESCRIPTION"));
        product.setPrice(rs.getDouble("PRICE"));
        product.setCondition(rs.getString("CONDITION"));
        product.setStatus(rs.getString("STATUS"));
        product.setImageUrl(rs.getString("IMAGE_URL"));
        product.setListedAt(rs.getTimestamp("LISTED_AT"));
        return product;
    }
}