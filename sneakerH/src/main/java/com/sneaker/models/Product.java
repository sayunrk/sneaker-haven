package com.sneaker.models;

public class Product {
    private int productId;
    private String productName;
    private String size;
    private int quantity;

    public Product(int productId, String productName, String size, int quantity) {
        this.productId = productId;
        this.productName = productName;
        this.size = size;
        this.quantity = quantity;
    }

    // Getters
    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public String getSize() {
        return size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
