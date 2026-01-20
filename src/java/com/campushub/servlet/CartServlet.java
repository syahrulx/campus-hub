package com.campushub.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.campushub.bean.CartItem;
import com.campushub.bean.Product;
import com.campushub.dao.CartDao;
import com.campushub.dao.ProductDao;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CartDao cartDao = new CartDao();
    private ProductDao productDao = new ProductDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String userId = (String) session.getAttribute("userId");
        List<CartItem> cartItems = cartDao.getCartItems(userId);

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
                int qtyReq = 1;
                try {
                    qtyReq = Integer.parseInt(request.getParameter("quantity"));
                } catch (Exception e) {
                    qtyReq = 1;
                }

                // Check if own product
                if (cartDao.isOwnProduct(userId, productId)) {
                    response.sendRedirect("cart");
                    break;
                }

                Product p = productDao.getProductById(productId);
                if (p == null || "SOLD".equalsIgnoreCase(p.getStatus()) || p.getQuantity() <= 0) {
                    response.sendRedirect("cart?error=Out+of+stock");
                    break;
                }

                int qty = Math.min(Math.max(qtyReq, 1), p.getQuantity());
                cartDao.addToCart(userId, productId, qty);
                response.sendRedirect("cart");
                break;
            }

            case "update": {
                String cartItemId = request.getParameter("cartItemId");
                int newQtyReq = Integer.parseInt(request.getParameter("quantity"));

                String productId = cartDao.getProductIdByCartItemId(cartItemId);
                Product p = (productId != null) ? productDao.getProductById(productId) : null;

                if (p == null || "SOLD".equalsIgnoreCase(p.getStatus()) || p.getQuantity() <= 0) {
                    cartDao.removeCartItem(cartItemId);
                    response.sendRedirect("cart?error=Item+out+of+stock");
                    break;
                }

                int newQty = Math.min(Math.max(newQtyReq, 1), p.getQuantity());
                cartDao.updateCartItemQuantity(cartItemId, newQty);
                response.sendRedirect("cart");
                break;
            }

            case "remove":
                String itemId = request.getParameter("cartItemId");
                cartDao.removeCartItem(itemId);
                response.sendRedirect("cart");
                break;

            default:
                response.sendRedirect("cart");
        }
    }
}
