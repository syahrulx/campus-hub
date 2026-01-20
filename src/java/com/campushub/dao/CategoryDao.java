package com.campushub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.campushub.util.DatabaseHelper;

/**
 * Data Access Object for Category operations.
 */
public class CategoryDao {

    /**
     * Get all categories with item counts.
     */
    public List<Object[]> getAllCategories() {
        String sql = "SELECT c.category_id, c.name, c.icon, " +
                "(SELECT COUNT(*) FROM APP.PRODUCT p WHERE p.category_id = c.category_id AND p.status = 'AVAILABLE') as item_count "
                +
                "FROM APP.CATEGORY c ORDER BY c.name";
        List<Object[]> categories = new ArrayList<>();

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                categories.add(new Object[] {
                        rs.getString("category_id"),
                        rs.getString("name"),
                        rs.getString("icon"),
                        rs.getInt("item_count")
                });
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    /**
     * Get category by ID.
     */
    public Object[] getCategoryById(String categoryId) {
        String sql = "SELECT category_id, name, icon FROM APP.CATEGORY WHERE category_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, categoryId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Object[] {
                            rs.getString("category_id"),
                            rs.getString("name"),
                            rs.getString("icon")
                    };
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get category name by ID.
     */
    public String getCategoryName(String categoryId) {
        String sql = "SELECT name FROM APP.CATEGORY WHERE category_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, categoryId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get categories for dropdown (id, name pairs).
     */
    public List<String[]> getCategoriesForDropdown() {
        List<String[]> categories = new ArrayList<>();
        String sql = "SELECT category_id, name FROM APP.CATEGORY ORDER BY name";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                categories.add(new String[] {
                        rs.getString("category_id"),
                        rs.getString("name")
                });
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
}
