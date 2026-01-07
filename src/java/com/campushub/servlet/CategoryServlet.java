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
import com.campushub.util.DatabaseHelper;

@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get categories with product counts
        List<Object[]> categories = getCategoriesWithCounts();
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/categories.jsp").forward(request, response);
    }

    private List<Object[]> getCategoriesWithCounts() {
        List<Object[]> categories = new ArrayList<>();
        String sql = "SELECT c.category_id, c.name, c.icon, " +
                "(SELECT COUNT(*) FROM APP.PRODUCT p WHERE p.category_id = c.category_id AND p.status = 'AVAILABLE') as product_count "
                +
                "FROM APP.CATEGORY c ORDER BY c.name";

        try (Connection conn = DatabaseHelper.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Object[] cat = new Object[4];
                cat[0] = rs.getString("category_id");
                cat[1] = rs.getString("name");
                cat[2] = rs.getString("icon");
                cat[3] = rs.getInt("product_count");
                categories.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
}
