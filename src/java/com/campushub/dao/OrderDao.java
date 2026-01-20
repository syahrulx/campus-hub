package com.campushub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import com.campushub.util.DatabaseHelper;

/**
 * Data Access Object for Order operations.
 */
public class OrderDao {

    /**
     * Get orders by buyer.
     */
    public List<Object[]> getOrdersByBuyer(String buyerId) {
        List<Object[]> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.quantity, o.total_amount, o.status, o.ordered_at, " +
                "p.name, p.image_url, p.product_id " +
                "FROM APP.ORDERS o " +
                "JOIN APP.PRODUCT p ON o.product_id = p.product_id " +
                "WHERE o.buyer_id = ? ORDER BY o.ordered_at DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, buyerId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    orders.add(new Object[] {
                            rs.getString("order_id"),
                            rs.getString("name"),
                            rs.getInt("quantity"),
                            rs.getDouble("total_amount"),
                            rs.getString("status"),
                            rs.getTimestamp("ordered_at"),
                            rs.getString("image_url"),
                            rs.getString("product_id")
                    });
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    /**
     * Get orders by seller.
     */
    public List<Object[]> getOrdersBySeller(String sellerId, String statusFilter) {
        List<Object[]> orders = new ArrayList<>();
        String sql = "SELECT o.order_id, o.quantity, o.total_amount, o.status, o.ordered_at, " +
                "p.name, p.image_url, p.product_id, p.price, " +
                "u.name as buyer_name, u.email as buyer_email, u.phone as buyer_phone " +
                "FROM APP.ORDERS o " +
                "JOIN APP.PRODUCT p ON o.product_id = p.product_id " +
                "JOIN APP.USERS u ON o.buyer_id = u.user_id " +
                "WHERE o.seller_id = ?";

        if (statusFilter != null && !statusFilter.isEmpty()) {
            sql += " AND o.status = ?";
        }
        sql += " ORDER BY o.ordered_at DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, sellerId);
            if (statusFilter != null && !statusFilter.isEmpty()) {
                ps.setString(2, statusFilter.toUpperCase());
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    orders.add(new Object[] {
                            rs.getString("order_id"),
                            rs.getString("name"),
                            rs.getInt("quantity"),
                            rs.getDouble("total_amount"),
                            rs.getString("status"),
                            rs.getTimestamp("ordered_at"),
                            rs.getString("image_url"),
                            rs.getString("product_id"),
                            rs.getDouble("price"),
                            rs.getString("buyer_name"),
                            rs.getString("buyer_email"),
                            rs.getString("buyer_phone")
                    });
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    /**
     * Get order by ID with full details.
     * Returns array in order expected by orderTracking.jsp:
     * [0]=order_id, [1]=product_name, [2]=quantity, [3]=total_amount, [4]=status,
     * [5]=ordered_at, [6]=image_url, [7]=product_id, [8]=price, [9]=description,
     * [10]=seller_name, [11]=seller_email, [12]=seller_phone, [13]=buyer_name
     */
    public Object[] getOrderById(String orderId) {
        String sql = "SELECT o.order_id, o.quantity, o.total_amount, o.status, o.ordered_at, " +
                "p.name as product_name, p.image_url, p.product_id, p.price, p.description, " +
                "seller.name as seller_name, seller.email as seller_email, seller.phone as seller_phone, " +
                "buyer.name as buyer_name " +
                "FROM APP.ORDERS o " +
                "JOIN APP.PRODUCT p ON o.product_id = p.product_id " +
                "JOIN APP.USERS seller ON o.seller_id = seller.user_id " +
                "JOIN APP.USERS buyer ON o.buyer_id = buyer.user_id " +
                "WHERE o.order_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, orderId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Object[] {
                            rs.getString("order_id"), // [0]
                            rs.getString("product_name"), // [1]
                            rs.getInt("quantity"), // [2]
                            rs.getDouble("total_amount"), // [3]
                            rs.getString("status"), // [4]
                            rs.getTimestamp("ordered_at"), // [5]
                            rs.getString("image_url"), // [6]
                            rs.getString("product_id"), // [7]
                            rs.getDouble("price"), // [8]
                            rs.getString("description"), // [9]
                            rs.getString("seller_name"), // [10]
                            rs.getString("seller_email"), // [11]
                            rs.getString("seller_phone"), // [12]
                            rs.getString("buyer_name") // [13]
                    };
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Create an order.
     */
    public boolean createOrder(String buyerId, String sellerId, String productId, int quantity, double totalAmount) {
        String sql = "INSERT INTO APP.ORDERS (order_id, product_id, buyer_id, seller_id, quantity, total_amount, status) "
                +
                "VALUES (?, ?, ?, ?, ?, ?, 'PENDING')";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "ord" + UUID.randomUUID().toString().substring(0, 8));
            ps.setString(2, productId);
            ps.setString(3, buyerId);
            ps.setString(4, sellerId);
            ps.setInt(5, quantity);
            ps.setDouble(6, totalAmount);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update order status.
     */
    public boolean updateOrderStatus(String orderId, String status) {
        String sql = "UPDATE APP.ORDERS SET status = ? WHERE order_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setString(2, orderId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Check if order belongs to seller.
     */
    public boolean isOrderOwnedBySeller(String orderId, String sellerId) {
        String sql = "SELECT 1 FROM APP.ORDERS WHERE order_id = ? AND seller_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, orderId);
            ps.setString(2, sellerId);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
