package campusController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import campus.bean.Product;

@WebServlet("/products")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mock Data
        List<Product> productList = new ArrayList<>();
        productList.add(new Product("1", "APPLE iPhone 13 Pro", "Advanced dual-camera system", 125999,
                "images/profile.jpg", "Electronics", "Used", "UTM Skudai", "Syahrul"));
        productList.add(new Product("2", "Samsung Galaxy S21", "Ultimate smartphone", 99999, "images/profile.jpg",
                "Electronics", "New", "UTM KL", "Ahmad"));
        productList.add(new Product("3", "Sony Bravia TV", "Stunning 4K picture", 75000, "images/profile.jpg",
                "Electronics", "Used", "Johor", "Siti"));

        request.setAttribute("featuredProducts", productList);

        // Forward to index.jsp
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
