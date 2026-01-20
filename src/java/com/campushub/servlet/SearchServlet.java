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

    private ProductDao productDao = new ProductDao();

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

        List<Product> products = productDao.searchProducts(query.trim());

        request.setAttribute("products", products);
        request.setAttribute("searchQuery", query);
        request.setAttribute("resultCount", products.size());
        request.getRequestDispatcher("/searchResults.jsp").forward(request, response);
    }
}
