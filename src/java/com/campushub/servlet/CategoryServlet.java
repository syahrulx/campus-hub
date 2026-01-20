package com.campushub.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.campushub.dao.CategoryDao;

@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CategoryDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get categories with product counts using DAO
        List<Object[]> categories = categoryDao.getAllCategories();
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("/categories.jsp").forward(request, response);
    }
}
