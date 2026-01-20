package com.campushub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import com.campushub.bean.Product;
import com.campushub.util.DatabaseHelper;

/**
 * Data Access Object for Product operations.
 */
public class ProductDao {

    /**
     * Get all available products.
     */
    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM APP.PRODUCT WHERE STATUS = 'AVAILABLE' ORDER BY LISTED_AT DESC";
        List<Product> products = new ArrayList<>();

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     * Get products by category.
     */
    public List<Product> getProductsByCategory(String categoryId) {
        String sql = "SELECT * FROM APP.PRODUCT WHERE STATUS = 'AVAILABLE' AND CATEGORY_ID = ? ORDER BY LISTED_AT DESC";
        List<Product> products = new ArrayList<>();

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, categoryId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     * Get products by seller.
     */
    public List<Product> getProductsBySeller(String sellerId) {
        String sql = "SELECT * FROM APP.PRODUCT WHERE SELLER_ID = ? ORDER BY LISTED_AT DESC";
        List<Product> products = new ArrayList<>();

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sellerId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     * Get product by ID.
     */
    public Product getProductById(String productId) {
        String sql = "SELECT * FROM APP.PRODUCT WHERE PRODUCT_ID = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, productId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToProduct(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Search products by name or description.
     */
    public List<Product> searchProducts(String query) {
        String searchTerm = "%" + query.toLowerCase() + "%";
        String sql = "SELECT * FROM APP.PRODUCT WHERE " +
                "(LOWER(NAME) LIKE ? OR LOWER(DESCRIPTION) LIKE ?) " +
                "AND STATUS = 'AVAILABLE' ORDER BY LISTED_AT DESC";
        List<Product> products = new ArrayList<>();

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, searchTerm);
            ps.setString(2, searchTerm);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    products.add(mapResultSetToProduct(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    /**
     * Add a new product.
     */
    public boolean addProduct(Product product) {
        String sql = "INSERT INTO APP.PRODUCT (product_id, seller_id, category_id, name, description, price, \"condition\", status, quantity, image_url) "
                +
                "VALUES (?, ?, ?, ?, ?, ?, ?, 'AVAILABLE', ?, ?)";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            String productId = "p" + UUID.randomUUID().toString().substring(0, 8);

            ps.setString(1, productId);
            ps.setString(2, product.getSellerId());
            ps.setString(3, product.getCategoryId());
            ps.setString(4, product.getName());
            ps.setString(5, product.getDescription());
            ps.setDouble(6, product.getPrice());
            ps.setString(7, product.getCondition());
            ps.setInt(8, product.getQuantity());
            ps.setString(9, product.getImageUrl());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update a product.
     */
    public boolean updateProduct(Product product) {
        String sql = "UPDATE APP.PRODUCT SET name = ?, description = ?, price = ?, \"condition\" = ?, category_id = ?, quantity = ?, image_url = ? WHERE product_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getCondition());
            ps.setString(5, product.getCategoryId());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getImageUrl());
            ps.setString(8, product.getProductId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Delete a product.
     */
    public boolean deleteProduct(String productId) {
        String sql = "DELETE FROM APP.PRODUCT WHERE product_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, productId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update product status (AVAILABLE, SOLD, etc.).
     */
    public boolean updateProductStatus(String productId, String status) {
        String sql = "UPDATE APP.PRODUCT SET status = ? WHERE product_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setString(2, productId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Helper method to map ResultSet to Product.
     */
    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
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
        // Handle quantity column if exists
        try {
            product.setQuantity(rs.getInt("QUANTITY"));
        } catch (SQLException e) {
            product.setQuantity(1);
        }
        return product;
    }
}
