package com.campushub.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.campushub.bean.Product;
import com.campushub.dao.ProductDao;
import com.campushub.dao.CategoryDao;

@WebServlet("/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDao productDao = new ProductDao();
    private CategoryDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Load categories for dropdown using DAO
        request.setAttribute("categories", categoryDao.getCategoriesForDropdown());
        request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String sellerId = (String) session.getAttribute("userId");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String categoryId = request.getParameter("categoryId");
        String condition = request.getParameter("condition");
        String quantityStr = request.getParameter("quantity");

        int quantity = 1;
        try {
            quantity = Integer.parseInt(quantityStr);
            if (quantity < 1)
                quantity = 1;
        } catch (NumberFormatException e) {
            quantity = 1;
        }

        // Handle file upload - convert to Base64 data URI
        String imageUrl = "images/product-placeholder.png";
        Part filePart = request.getPart("imageFile");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream input = filePart.getInputStream()) {
                java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream();
                int nRead;
                byte[] data = new byte[16384];
                while ((nRead = input.read(data, 0, data.length)) != -1) {
                    buffer.write(data, 0, nRead);
                }
                byte[] imageBytes = buffer.toByteArray();
                String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);
                String mimeType = filePart.getContentType();
                if (mimeType == null)
                    mimeType = "image/jpeg";
                imageUrl = "data:" + mimeType + ";base64," + base64Image;
            }
        }

        double price;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid price format");
            request.setAttribute("categories", categoryDao.getCategoriesForDropdown());
            request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
            return;
        }

        // Create product using DAO
        Product product = new Product();
        product.setSellerId(sellerId);
        product.setCategoryId(categoryId);
        product.setName(name);
        product.setDescription(description);
        product.setPrice(price);
        product.setCondition(condition);
        product.setQuantity(quantity);
        product.setImageUrl(imageUrl);

        boolean success = productDao.addProduct(product);

        if (success) {
            response.sendRedirect("sellerListings.jsp?success=Product added successfully!");
        } else {
            request.setAttribute("error", "Failed to add product. Please try again.");
            request.setAttribute("categories", categoryDao.getCategoriesForDropdown());
            request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
        }
    }
}
