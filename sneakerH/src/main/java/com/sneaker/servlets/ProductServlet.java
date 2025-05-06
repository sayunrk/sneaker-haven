package com.sneaker.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

import com.sneaker.models.Product;
import com.sneaker.util.DbConfig;

public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM product";
        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("Product_Id");
                String name = rs.getString("Product_Name");
                String size = rs.getString("Size");
                int qty = rs.getInt("Quantity");

                Product product = new Product(id, name, size, qty);
                products.add(product);
            }

            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }
}
