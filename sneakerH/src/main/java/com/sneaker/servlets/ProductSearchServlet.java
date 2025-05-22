package com.sneaker.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import com.sneaker.controller.ProductController;
import com.sneaker.models.Product;

@WebServlet("/ProductSearch")
public class ProductSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductController productController;

    public void init() throws ServletException {
        productController = new ProductController();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null || !("admin".equals(session.getAttribute("role")) || "customer".equals(session.getAttribute("role")))) {
            response.sendRedirect("login.jsp?error=Please log in to view products");
            return;
        }

        try {
            List<Product> products = productController.getAllProducts();
            request.setAttribute("products", products);
            System.out.println("doGet: Loaded " + products.size() + " products");
        } catch (Exception e) {
            request.setAttribute("error", "Error loading products: " + e.getMessage());
            System.out.println("doGet: Error - " + e.getMessage());
        }
        request.getRequestDispatcher("displayProducts.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null || !("admin".equals(session.getAttribute("role")) || "customer".equals(session.getAttribute("role")))) {
            response.sendRedirect("login.jsp?error=Please log in to view products");
            return;
        }

        String searchTerm = request.getParameter("searchTerm");
        List<Product> products;

        try {
            if (searchTerm == null || searchTerm.trim().isEmpty()) {
                products = productController.getAllProducts();
                System.out.println("doPost: No search term, loaded " + products.size() + " products");
            } else {
                products = productController.searchProducts(searchTerm.trim());
                System.out.println("doPost: Search term '" + searchTerm + "' returned " + products.size() + " products");
            }
            request.setAttribute("products", products);
        } catch (Exception e) {
            request.setAttribute("error", "Error searching products: " + e.getMessage());
            System.out.println("doPost: Error - " + e.getMessage());
        }

        request.getRequestDispatcher("displayProducts.jsp").forward(request, response);
    }
}