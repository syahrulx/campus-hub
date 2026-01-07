package com.campushub.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.bean.Product;
import com.campushub.util.DatabaseHelper;

@WebServlet("/removeProduct")
public class RemoveProductServlet extends HttpServlet {

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
            response.sendRedirect("sellerListings.jsp");
            return;
        }

        Product product = getProductById(productId);
        if (product == null || !product.getSellerId().equals(userId)) {
            response.sendRedirect("sellerListings.jsp?error=Unauthorized");
            return;
        }
        
        request.setAttribute("product", product);
        request.getRequestDispatcher("/removeProduct.jsp").forward(request, response);
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
        String productId = request.getParameter("productId");

        if (productId == null || productId.isEmpty()) {
            response.sendRedirect("sellerListings.jsp?error=Invalid+product");
            return;
        }

        // Verify ownership
        Product product = getProductById(productId);
        if (product == null || !product.getSellerId().equals(userId)) {
            response.sendRedirect("sellerListings.jsp?error=Unauthorized");
            return;
        }

        // Delete product
        boolean deleted = deleteProduct(productId);
        if (deleted) {
            response.sendRedirect("sellerListings.jsp?success=Product+deleted");
        } else {
            response.sendRedirect("sellerListings.jsp?error=Deletion+failed");//here
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
                    p.setListedAt(rs.getTimestamp("listed_at"));
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}