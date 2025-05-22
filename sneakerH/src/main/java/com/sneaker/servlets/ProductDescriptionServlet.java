package com.sneaker.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.sneaker.controller.ProductController;
import com.sneaker.models.Product;

@WebServlet("/ProductDescription")
public class ProductDescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductController productController;

    public void init() throws ServletException {
        productController = new ProductController();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null || !("admin".equals(session.getAttribute("role")) || "customer".equals(session.getAttribute("role")))) {
            response.sendRedirect("login.jsp?error=Please log in to view product details");
            return;
        }

        String productIdParam = request.getParameter("productId");
        try {
            int productId = Integer.parseInt(productIdParam);
            Product product = productController.getProductById(productId);
            if (product != null) {
                request.setAttribute("product", product);
                System.out.println("ProductDescriptionServlet: Loaded product ID " + productId);
            } else {
                request.setAttribute("error", "Product not found");
                System.out.println("ProductDescriptionServlet: Product ID " + productId + " not found");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid product ID");
            System.out.println("ProductDescriptionServlet: Invalid product ID - " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("error", "Error loading product: " + e.getMessage());
            System.out.println("ProductDescriptionServlet: Error - " + e.getMessage());
        }

        request.getRequestDispatcher("productDescription.jsp").forward(request, response);
    }
}