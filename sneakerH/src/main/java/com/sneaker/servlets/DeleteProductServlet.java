package com.sneaker.servlets;

import java.io.IOException;

import com.sneaker.controller.ProductController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProduct")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductController productController;

    public void init() throws ServletException {
        productController = new ProductController();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            boolean success = productController.deleteProduct(productId);
            if (success) {
                request.setAttribute("message", "Product with ID " + productId + " deleted successfully.");
            } else {
                request.setAttribute("message", "Failed to delete product with ID " + productId + ".");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid Product ID format.");
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }
        
        request.getRequestDispatcher("deleteProduct.jsp").forward(request, response);
    }
}