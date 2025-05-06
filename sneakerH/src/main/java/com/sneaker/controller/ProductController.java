package com.sneaker.controller;

import com.sneaker.models.Product;
import com.sneaker.util.DbConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductController {

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();

        String sql = "SELECT Product_Id, Product_Name, Size, Quantity FROM product";

        try (Connection conn = DbConfig.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("Product_Id"),
                        rs.getString("Product_Name"),
                        rs.getString("Size"),
                        rs.getInt("Quantity")
                );
                products.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }
}
