package com.sneaker.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.sneaker.controller.ProductController;
import com.sneaker.models.Product;

@WebServlet("/UpdateProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductController productController;
    private static final String UPLOAD_DIR = "/Assets";

    public void init() throws ServletException {
        productController = new ProductController();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            Product product = productController.getProductById(productId);
            if (product != null) {
                request.setAttribute("product", product);
            } else {
                request.setAttribute("message", "Product with ID " + productId + " not found.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid Product ID format.");
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }
        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String size = request.getParameter("size");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int price = Integer.parseInt(request.getParameter("price"));
            Part filePart = request.getPart("image");
            String description = request.getParameter("description");
            
            String image = null;

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath(UPLOAD_DIR);
                Files.createDirectories(Paths.get(uploadPath));
                String filePath = uploadPath + "/" + fileName;

                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                }

                image = fileName; 
            }

            Product existingProduct = productController.getProductById(productId);
            if (existingProduct == null) {
                request.setAttribute("message", "Product not found.");
            } else {
                if (image == null) {
                    image = existingProduct.getImage(); 
                }
                if (description == null || description.trim().isEmpty()) {
                    description = existingProduct.getDescription(); 
                }
                
                System.out.println("Updating product with values:");
                System.out.println("ID: " + productId);
                System.out.println("Name: " + productName);
                System.out.println("Size: " + size);
                System.out.println("Quantity: " + quantity);
                System.out.println("Price: " + price);
                System.out.println("Image: " + image);
                System.out.println("Description: " + description);

                Product updatedProduct = new Product(productId, productName, size, quantity, image, price, description);
                boolean success = productController.updateProduct(updatedProduct);

                if (success) {
                    request.setAttribute("message", "Product with ID " + productId + " updated successfully.");
                } else {
                    request.setAttribute("message", "Failed to update product with ID " + productId + ".");
                }

                request.setAttribute("product", updatedProduct);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid input format.");
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }

        request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
    }
}
