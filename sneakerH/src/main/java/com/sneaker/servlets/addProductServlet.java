package com.sneaker.servlets;

import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import com.sneaker.models.Product;
import com.sneaker.controller.ProductController;

@WebServlet("/addProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class addProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductController productController;
    private static final String UPLOAD_DIR = "Assets";

    public void init() throws ServletException {
        productController = new ProductController();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("Product_Name");
            String size = request.getParameter("Size");
            int quantity = Integer.parseInt(request.getParameter("Quantity"));
            int price = Integer.parseInt(request.getParameter("Price"));
            String description = request.getParameter("Description"); 

            Part filePart = request.getPart("Image");
            String image = null;

            // Handle image upload
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIR;
                Files.createDirectories(Paths.get(uploadPath));
                String filePath = uploadPath + "/" + fileName;
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                }
                image = fileName;
            }

            Product product = new Product(0, name, size, quantity, image, price, description); 
            boolean success = productController.addProduct(product);

            if (success) {
                response.sendRedirect("ProductDisplayServlet");
            } else {
                request.setAttribute("error", "Failed to add product.");
                request.getRequestDispatcher("addProduct.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Price and Quantity must be valid numbers.");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
    }
}
