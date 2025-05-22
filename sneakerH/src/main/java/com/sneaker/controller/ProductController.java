package com.sneaker.controller;

import com.sneaker.models.Product;
import com.sneaker.util.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductController {
    // Get all products
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DbConfig.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT Product_Id, Product_Name, Size, Quantity, Image, Price, Description FROM product";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Product product = new Product(
                    rs.getInt("Product_Id"),
                    rs.getString("Product_Name"),
                    rs.getString("Size"),
                    rs.getInt("Quantity"),
                    rs.getString("Image"),
                    rs.getInt("Price"),
                    rs.getString("Description")
                );
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return products;
    }

    // Search products by name
    public List<Product> searchProducts(String searchTerm) {
        List<Product> products = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DbConfig.getConnection();
            String sql = "SELECT Product_Id, Product_Name, Size, Quantity, Image, Price, Description FROM product WHERE Product_Name LIKE ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + searchTerm + "%");
            rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product(
                    rs.getInt("Product_Id"),
                    rs.getString("Product_Name"),
                    rs.getString("Size"),
                    rs.getInt("Quantity"),
                    rs.getString("Image"),
                    rs.getInt("Price"),
                    rs.getString("Description")
                );
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return products;
    }

    // Add a product
    public boolean addProduct(Product product) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;

        try {
            conn = DbConfig.getConnection();
            String sql = "INSERT INTO product (Product_Name, Size, Quantity, Image, Price, Description) VALUES (?, ?, ?, ?, ?,?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getSize());
            stmt.setInt(3, product.getQuantity());
            stmt.setString(4, product.getImage());
            stmt.setInt(5, product.getPrice());
            stmt.setString(6, product.getDescription());
            int rowsAffected = stmt.executeUpdate();
            success = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return success;
    }

    public boolean deleteProduct(int productId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;

        try {
            conn = DbConfig.getConnection();
            String sql = "DELETE FROM product WHERE Product_Id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, productId);
            int rowsAffected = stmt.executeUpdate();
            success = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return success;
    }

    // Get a product by ID
    public Product getProductById(int productId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Product product = null;

        try {
            conn = DbConfig.getConnection();
            String sql = "SELECT Product_Id, Product_Name, Size, Quantity, Image, Price, Description FROM product WHERE Product_Id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, productId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                product = new Product(
                    rs.getInt("Product_Id"),
                    rs.getString("Product_Name"),
                    rs.getString("Size"),
                    rs.getInt("Quantity"),
                    rs.getString("Image"),
                    rs.getInt("Price"),
                    rs.getString("Description")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return product;
    }

    // Update a product
    public boolean updateProduct(Product product) {
        Connection conn = null;
        PreparedStatement stmt = null;
        boolean success = false;

        try {
            conn = DbConfig.getConnection();
            String sql = "UPDATE product SET Product_Name = ?, Size = ?, Quantity = ?, Image = COALESCE(?, Image), Price = ?, Description = ? WHERE Product_Id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getSize());
            stmt.setInt(3, product.getQuantity());
            stmt.setString(4, product.getImage());
            stmt.setInt(5, product.getPrice());
            stmt.setString(6, product.getDescription()); 
            stmt.setInt(7, product.getProductId());      

            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            success = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return success;
    }

}