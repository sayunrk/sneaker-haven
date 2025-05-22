package com.sneaker.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.sneaker.util.DbConfig;
import com.sneaker.util.HashUtil;

public class RegisterController {

	public static boolean registerUser(String userName, String address, String phoneNumber, String password, String email) {
		String sql = "INSERT INTO user (User_Name, Address, Phone_Number, `Password`, Email, role) VALUES (?, ?, ?, ?, ?, ?)";

	    try (Connection conn = DbConfig.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        String hashedPassword = HashUtil.hashPassword(password);

	        System.out.println("RegisterController: Preparing to insert user.");
	        System.out.println("userName: " + userName);
	        System.out.println("address: " + address);
	        System.out.println("phoneNumber: " + phoneNumber);
	        System.out.println("email: " + email);
	        System.out.println("hashedPassword: " + hashedPassword);

	        stmt.setString(1, userName);
	        stmt.setString(2, address);
	        stmt.setString(3, phoneNumber);
	        stmt.setString(4, hashedPassword);
	        stmt.setString(5, email);
	        stmt.setString(6, "customer"); 

	        int rowsAffected = stmt.executeUpdate();
	        System.out.println("Rows affected: " + rowsAffected);

	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        System.err.println("SQL Error: " + e.getMessage());
	        e.printStackTrace();
	        return false;
	    }
	}

}