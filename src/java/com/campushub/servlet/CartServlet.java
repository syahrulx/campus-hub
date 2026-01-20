package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.bean.CartItem;
import com.campushub.bean.Product;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
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

        String userId = (String) session.getAttribute("userId");
        List<CartItem> cartItems = getCartItems(userId);

        double total = 0;
        for (CartItem item : cartItems) {
            total += item.getSubtotal();
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("cartTotal", total);
        request.getRequestDispatcher("/cartDetails.jsp").forward(request, response);
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

        switch (action) {
            case "add": {
                String productId = request.getParameter("productId");
                int qtyReq = Integer.parseInt(request.getParameter("quantity") != null ? request.getParameter("quantity") : "1");

                if (isOwnProduct(userId, productId)) {
                    response.sendRedirect("cart");
                    break;
                }

                Product p = getProductForCart(productId);
                if (p == null || "SOLD".equalsIgnoreCase(p.getStatus()) || p.getQuantity() <= 0) {
                    response.sendRedirect("cart?error=Out+of+stock");
                    break;
                }

                int qty = Math.min(Math.max(qtyReq, 1), p.getQuantity());
                addToCart(userId, productId, qty);

                response.sendRedirect("cart");
                break;
            }

            case "update": {
                String cartItemId = request.getParameter("cartItemId");
                int newQtyReq = Integer.parseInt(request.getParameter("quantity"));

                String productId = getProductIdByCartItemId(cartItemId);
                Product p = (productId != null) ? getProductForCart(productId) : null;

                if (p == null || "SOLD".equalsIgnoreCase(p.getStatus()) || p.getQuantity() <= 0) {
                    removeCartItem(cartItemId);
                    response.sendRedirect("cart?error=Item+out+of+stock");
                    break;
                }

                int newQty = Math.min(Math.max(newQtyReq, 1), p.getQuantity());
                updateCartItem(cartItemId, newQty);

                response.sendRedirect("cart");
                break;
            }

            case "remove":
                String itemId = request.getParameter("cartItemId");
                removeCartItem(itemId);
                response.sendRedirect("cart");
                break;

            default:
                response.sendRedirect("cart");
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

    private boolean isOwnProduct(String userId, String productId) {
        String sql = "SELECT 1 FROM APP.PRODUCT WHERE product_id = ? AND seller_id = ?";
        try (Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, productId);
            pstmt.setString(2, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private String getOrCreateCart(String userId) {
        String cartId = null;

        // Check if cart exists
        String selectSql = "SELECT cart_id FROM APP.CART WHERE user_id = ?";
        try (Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(selectSql)) {
            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
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
            try (Connection conn = getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(insertSql)) {
                pstmt.setString(1, cartId);
                pstmt.setString(2, userId);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return cartId;
    }

    private void addToCart(String userId, String productId, int quantity) {
        String cartId = getOrCreateCart(userId);

        // Check if product already in cart
        String checkSql = "SELECT cart_item_id, quantity FROM APP.CART_ITEM WHERE cart_id = ? AND product_id = ?";
        try (Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(checkSql)) {
            pstmt.setString(1, cartId);
            pstmt.setString(2, productId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Update quantity
                    String cartItemId = rs.getString("cart_item_id");
                    int existingQty = rs.getInt("quantity");
                    updateCartItem(cartItemId, existingQty + quantity);
                    return;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Insert new cart item
        String insertSql = "INSERT INTO APP.CART_ITEM (cart_item_id, cart_id, product_id, quantity) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(insertSql)) {
            pstmt.setString(1, "ci" + UUID.randomUUID().toString().substring(0, 8));
            pstmt.setString(2, cartId);
            pstmt.setString(3, productId);
            pstmt.setInt(4, quantity);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateCartItem(String cartItemId, int quantity) {
        if (quantity <= 0) {
            removeCartItem(cartItemId);
            return;
        }

        String sql = "UPDATE APP.CART_ITEM SET quantity = ? WHERE cart_item_id = ?";
        try (Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, quantity);
            pstmt.setString(2, cartItemId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void removeCartItem(String cartItemId) {
        String sql = "DELETE FROM APP.CART_ITEM WHERE cart_item_id = ?";
        try (Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, cartItemId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private List<CartItem> getCartItems(String userId) {
        List<CartItem> items = new ArrayList<>();
        String cartId = getOrCreateCart(userId);

        String sql
                = "SELECT ci.cart_item_id, ci.cart_id, ci.product_id, ci.quantity AS cart_qty, ci.added_at, "
                + "       p.name, p.description, p.price, p.image_url, p.quantity AS stock_qty, p.status "
                + "FROM APP.CART_ITEM ci "
                + "JOIN APP.PRODUCT p ON ci.product_id = p.product_id "
                + "WHERE ci.cart_id = ?";

        try (Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, cartId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String cartItemId = rs.getString("cart_item_id");
                    String productId = rs.getString("product_id");
                    int cartQty = rs.getInt("cart_qty");
                    int stockQty = rs.getInt("stock_qty");
                    String status = rs.getString("status");

                    // If product cannot be bought, remove from cart
                    if (stockQty <= 0 || "SOLD".equalsIgnoreCase(status)) {
                        removeCartItem(conn, cartItemId); // overload that uses same connection
                        continue;
                    }

                    // Clamp quantity to available stock
                    if (cartQty > stockQty) {
                        cartQty = stockQty;
                        updateCartItem(conn, cartItemId, cartQty); // overload that uses same connection
                    }

                    CartItem item = new CartItem();
                    item.setCartItemId(cartItemId);
                    item.setCartId(rs.getString("cart_id"));
                    item.setProductId(productId);
                    item.setQuantity(cartQty);
                    item.setAddedAt(rs.getTimestamp("added_at"));

                    Product product = new Product();
                    product.setProductId(productId);
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImageUrl(rs.getString("image_url"));
                    product.setQuantity(stockQty);
                    product.setStatus(status);

                    item.setProduct(product);
                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }
    
    private void updateCartItem(Connection conn, String cartItemId, int quantity) throws SQLException {
        if (quantity <= 0) {
            removeCartItem(conn, cartItemId);
            return;
        }
        String sql = "UPDATE APP.CART_ITEM SET quantity = ? WHERE cart_item_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setString(2, cartItemId);
            ps.executeUpdate();
        }
    }

    private void removeCartItem(Connection conn, String cartItemId) throws SQLException {
        String sql = "DELETE FROM APP.CART_ITEM WHERE cart_item_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, cartItemId);
            ps.executeUpdate();
        }
    }

    private Product getProductForCart(String productId) {
        String sql = "SELECT quantity, status FROM APP.PRODUCT WHERE product_id = ?";
        try (Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Product p = new Product();
                    p.setProductId(productId);
                    p.setQuantity(rs.getInt("quantity"));
                    p.setStatus(rs.getString("status"));
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private String getProductIdByCartItemId(String cartItemId) {
        String sql = "SELECT product_id FROM APP.CART_ITEM WHERE cart_item_id = ?";
        try (Connection conn = getConnection();
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
