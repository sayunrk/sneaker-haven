package com.sneaker.models;

public class User {
	private int userId;
    private String userName;
    private String address;
    private String phoneNumber;
    private String email;
    private String role;
    private String image;

    
    public User(int userId, String userName, String address, String phoneNumber, String email, String role, String image) {
        this.userId = userId;
        this.userName = userName;
        this.setAddress(address);
        this.setPhoneNumber(phoneNumber);
        this.setEmail(email);
        this.role = role;
        this.setImage(image);
    }
    

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public User(int userId, String userName, String role) {
	    this.userId = userId;
	    this.userName = userName;
	    this.role = role;
	}

}