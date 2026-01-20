package com.campushub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import com.campushub.bean.CartItem;
import com.campushub.bean.Product;
import com.campushub.util.DatabaseHelper;

/**
 * Data Access Object for Cart operations.
 */
public class CartDao {

    /**
     * Get or create cart for user.
     */
    public String getOrCreateCart(String userId) {
        String cartId = null;

        // Check if cart exists
        String selectSql = "SELECT cart_id FROM APP.CART WHERE user_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(selectSql)) {
            ps.setString(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cartId = rs.getString("cart_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Create cart if not exists
        if (cartId == null) {
            cartId = "cart" + UUID.randomUUID().toString().substring(0, 8);
            String insertSql = "INSERT INTO APP.CART (cart_id, user_id) VALUES (?, ?)";
            try (Connection conn = DatabaseHelper.getConnection();
                    PreparedStatement ps = conn.prepareStatement(insertSql)) {
                ps.setString(1, cartId);
                ps.setString(2, userId);
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return cartId;
    }

    /**
     * Get cart items with product details.
     */
    public List<CartItem> getCartItems(String userId) {
        List<CartItem> items = new ArrayList<>();
        String cartId = getOrCreateCart(userId);

        String sql = "SELECT ci.cart_item_id, ci.cart_id, ci.product_id, ci.quantity AS cart_qty, ci.added_at, " +
                "p.name, p.description, p.price, p.image_url, p.quantity AS stock_qty, p.status " +
                "FROM APP.CART_ITEM ci " +
                "JOIN APP.PRODUCT p ON ci.product_id = p.product_id " +
                "WHERE ci.cart_id = ?";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, cartId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CartItem item = new CartItem();
                    item.setCartItemId(rs.getString("cart_item_id"));
                    item.setCartId(rs.getString("cart_id"));
                    item.setProductId(rs.getString("product_id"));
                    item.setQuantity(rs.getInt("cart_qty"));
                    item.setAddedAt(rs.getTimestamp("added_at"));

                    Product product = new Product();
                    product.setProductId(rs.getString("product_id"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImageUrl(rs.getString("image_url"));
                    product.setQuantity(rs.getInt("stock_qty"));
                    product.setStatus(rs.getString("status"));

                    item.setProduct(product);
                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    /**
     * Add item to cart.
     */
    public boolean addToCart(String userId, String productId, int quantity) {
        String cartId = getOrCreateCart(userId);

        // Check if product already in cart
        String checkSql = "SELECT cart_item_id, quantity FROM APP.CART_ITEM WHERE cart_id = ? AND product_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(checkSql)) {
            ps.setString(1, cartId);
            ps.setString(2, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Update quantity
                    String cartItemId = rs.getString("cart_item_id");
                    int existingQty = rs.getInt("quantity");
                    return updateCartItemQuantity(cartItemId, existingQty + quantity);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        // Insert new cart item
        String insertSql = "INSERT INTO APP.CART_ITEM (cart_item_id, cart_id, product_id, quantity) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(insertSql)) {
            ps.setString(1, "ci" + UUID.randomUUID().toString().substring(0, 8));
            ps.setString(2, cartId);
            ps.setString(3, productId);
            ps.setInt(4, quantity);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update cart item quantity.
     */
    public boolean updateCartItemQuantity(String cartItemId, int quantity) {
        if (quantity <= 0) {
            return removeCartItem(cartItemId);
        }

        String sql = "UPDATE APP.CART_ITEM SET quantity = ? WHERE cart_item_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setString(2, cartItemId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Remove cart item.
     */
    public boolean removeCartItem(String cartItemId) {
        String sql = "DELETE FROM APP.CART_ITEM WHERE cart_item_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cartItemId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Clear all items from cart.
     */
    public boolean clearCart(String cartId) {
        String sql = "DELETE FROM APP.CART_ITEM WHERE cart_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cartId);
            return ps.executeUpdate() >= 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Check if product is owned by user (can't add own product to cart).
     */
    public boolean isOwnProduct(String userId, String productId) {
        String sql = "SELECT 1 FROM APP.PRODUCT WHERE product_id = ? AND seller_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, productId);
            ps.setString(2, userId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Get product ID by cart item ID.
     */
    public String getProductIdByCartItemId(String cartItemId) {
        String sql = "SELECT product_id FROM APP.CART_ITEM WHERE cart_item_id = ?";
        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cartItemId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getString("product_id") : null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
