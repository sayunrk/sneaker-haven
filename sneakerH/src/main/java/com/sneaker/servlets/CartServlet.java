package com.sneaker.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.sneaker.controller.ProductController;
import com.sneaker.models.Product;
import com.sneaker.models.CartItem;

@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductController productController;

    public void init() throws ServletException {
        productController = new ProductController();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null || !("admin".equals(session.getAttribute("role")) || "customer".equals(session.getAttribute("role")))) {
            response.sendRedirect("login.jsp?error=Please log in to view your cart");
            return;
        }

        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null || !("admin".equals(session.getAttribute("role")) || "customer".equals(session.getAttribute("role")))) {
            response.sendRedirect("login.jsp?error=Please log in to add to cart");
            return;
        }

        String productIdParam = request.getParameter("productId");
        String quantityParam = request.getParameter("quantity");

        try {
            int productId = Integer.parseInt(productIdParam);
            int quantity = Integer.parseInt(quantityParam);

            Product product = productController.getProductById(productId);
            if (product == null) {
                request.setAttribute("error", "Product not found");
                request.getRequestDispatcher("productDescription.jsp").forward(request, response);
                return;
            }

            if (quantity <= 0 || quantity > product.getQuantity()) {
                request.setAttribute("error", "Invalid quantity or insufficient stock");
                request.setAttribute("product", product);
                request.getRequestDispatcher("productDescription.jsp").forward(request, response);
                return;
            }

            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }

            // Check if product is already in cart
            boolean itemExists = false;
            for (CartItem item : cart) {
                if (item.getProductId() == productId && item.getSize().equals(product.getSize())) {
                    int newQuantity = item.getQuantity() + quantity;
                    if (newQuantity > product.getQuantity()) {
                        request.setAttribute("error", "Cannot add more items than available stock");
                        request.setAttribute("product", product);
                        request.getRequestDispatcher("productDescription.jsp").forward(request, response);
                        return;
                    }
                    item.setQuantity(newQuantity);
                    itemExists = true;
                    break;
                }
            }

            if (!itemExists) {
                CartItem cartItem = new CartItem(
                    product.getProductId(),
                    product.getProductName(),
                    product.getSize(),
                    product.getPrice(),
                    quantity
                );
                cart.add(cartItem);
            }

            System.out.println("CartServlet: Added product ID " + productId + ", Quantity: " + quantity + ", Cart size: " + cart.size());
            response.sendRedirect("CartServlet?message=Item added to cart");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input");
            Product product = productController.getProductById(Integer.parseInt(productIdParam));
            if (product != null) {
                request.setAttribute("product", product);
            }
            request.getRequestDispatcher("productDescription.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error adding to cart: " + e.getMessage());
            Product product = productController.getProductById(Integer.parseInt(productIdParam));
            if (product != null) {
                request.setAttribute("product", product);
            }
            request.getRequestDispatcher("productDescription.jsp").forward(request, response);
        }
    }
}