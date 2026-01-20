package com.campushub.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.campushub.bean.Product;
import com.campushub.dao.ProductDao;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ProductDao productDao = new ProductDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String q = request.getParameter("q");
        if (q == null) q = "";
        q = q.trim();

        // Empty query -> show normal marketplace (no results filter)
        if (q.isEmpty()) {
            request.setAttribute("featuredProducts", new ArrayList<Product>());
            request.setAttribute("searchQuery", "");
            request.setAttribute("selectedCategory", null);
            request.setAttribute("categoryName", null);
            request.getRequestDispatcher("/viewProducts.jsp").forward(request, response);
            return;
        }

        List<Product> products = productDao.searchProducts(q);

        request.setAttribute("featuredProducts", products);
        request.setAttribute("searchQuery", q);
        request.setAttribute("selectedCategory", null);
        request.setAttribute("categoryName", "Search Results");

        request.getRequestDispatcher("/viewProducts.jsp").forward(request, response);
    }
}