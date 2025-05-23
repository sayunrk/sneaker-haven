package com.sneaker.models;

public class Product {
    private int productId;
    private String productName;
    private String size;
    private int quantity;
    private String image;
    private int price;
    private String description;

    // Constructor
    public Product(int productId, String productName, String size, int quantity, String image, int price, String description) {
        this.productId = productId;
        this.productName = productName;
        this.size = size;
        this.quantity = quantity;
        this.image = image;
        this.price = price;
        this.setDescription(description);
    }

    // Getters and Setters
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
