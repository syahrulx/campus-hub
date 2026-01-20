package com.campushub.servlet;

import com.campushub.bean.Product;
import com.campushub.dao.ProductDao;
import com.campushub.dao.CategoryDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDao productDao = new ProductDao();
    private CategoryDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");
        if (category != null)
            category = category.trim();

        List<Product> productList = (category == null || category.isEmpty())
                ? productDao.getAllProducts()
                : productDao.getProductsByCategory(category);

        request.setAttribute("featuredProducts", productList);
        request.setAttribute("selectedCategory", category);

        // Get category name
        String categoryName = categoryDao.getCategoryName(category);
        request.setAttribute("categoryName", categoryName);

        request.getRequestDispatcher("/viewProducts.jsp").forward(request, response);
    }
}