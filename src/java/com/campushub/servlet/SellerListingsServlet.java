package com.campushub.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.bean.Product;
import com.campushub.dao.ProductDao;
import com.campushub.util.DatabaseHelper;

@WebServlet("/sellerListings")
public class SellerListingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDao productDao = new ProductDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String sellerId = (String) session.getAttribute("userId");

        // Get seller's products using DAO
        List<Product> listings = productDao.getProductsBySeller(sellerId);
        request.setAttribute("sellerListings", listings);

        // Get stats (still using DatabaseHelper for aggregate queries)
        int activeCount = DatabaseHelper.count("PRODUCT", "seller_id = ? AND status = 'AVAILABLE'", sellerId);
        int soldCount = DatabaseHelper.count("PRODUCT", "seller_id = ? AND status = 'SOLD'", sellerId);
        double totalEarnings = DatabaseHelper.sum("ORDERS", "total_amount", "seller_id = ? AND status = 'COMPLETED'",
                sellerId);
        int pendingOrders = DatabaseHelper.count("ORDERS", "seller_id = ? AND status = 'PENDING'", sellerId);

        request.setAttribute("activeCount", activeCount);
        request.setAttribute("soldCount", soldCount);
        request.setAttribute("totalEarnings", totalEarnings);
        request.setAttribute("pendingOrders", pendingOrders);

        request.getRequestDispatcher("/sellerListings.jsp").forward(request, response);
    }
}
