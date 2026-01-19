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
import com.campushub.bean.Product;
import com.campushub.util.DatabaseHelper;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("q");

        if (query == null || query.trim().isEmpty()) {
            request.setAttribute("products", new ArrayList<Product>());
            request.setAttribute("searchQuery", "");
            request.getRequestDispatcher("/searchResults.jsp").forward(request, response);
            return;
        }

        String searchTerm = "%" + query.trim().toLowerCase() + "%";
        List<Product> products = searchProducts(searchTerm);

        request.setAttribute("products", products);
        request.setAttribute("searchQuery", query);
        request.setAttribute("resultCount", products.size());
        request.getRequestDispatcher("/searchResults.jsp").forward(request, response);
    }

    private List<Product> searchProducts(String searchTerm) {
        List<Product> products = new ArrayList<>();
        // Use uppercase column names for Derby compatibility
        String sql = "SELECT * FROM APP.PRODUCT WHERE " +
                "(LOWER(NAME) LIKE LOWER(?) OR LOWER(DESCRIPTION) LIKE LOWER(?)) " +
                "AND STATUS = 'AVAILABLE' " +
                "ORDER BY LISTED_AT DESC";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, searchTerm);
            pstmt.setString(2, searchTerm);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getString("PRODUCT_ID"));
                    p.setSellerId(rs.getString("SELLER_ID"));
                    p.setCategoryId(rs.getString("CATEGORY_ID"));
                    p.setName(rs.getString("NAME"));
                    p.setDescription(rs.getString("DESCRIPTION"));
                    p.setPrice(rs.getDouble("PRICE"));
                    p.setCondition(rs.getString("CONDITION"));
                    p.setStatus(rs.getString("STATUS"));
                    p.setImageUrl(rs.getString("IMAGE_URL"));
                    p.setListedAt(rs.getTimestamp("LISTED_AT"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            System.err.println("Search query error: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
}
