package com.sneaker.servlets;

import com.sneaker.controller.ProductController;
import com.sneaker.models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayProduct")
public class ProductDisplayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductController controller = new ProductController();
        List<Product> products = controller.getAllProducts();

        // Set products as request attribute
        request.setAttribute("products", products);

        // Forward to JSP
        request.getRequestDispatcher("/displayProducts.jsp").forward(request, response);
    }
}