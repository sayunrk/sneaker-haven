package com.sneaker.servlets;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

import com.sneaker.util.DbConfig;

public class RegisterServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {


		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form data
        String userName = request.getParameter("userName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        if (userName == null || userName.isEmpty() || 
            address == null || address.isEmpty() || 
            phoneNumber == null || phoneNumber.isEmpty() || 
            password == null || password.isEmpty() || 
            email == null || email.isEmpty()) {
            
            response.sendRedirect("register.jsp?error=Please fill in all fields");
            return;
        }

        String sql = "INSERT INTO user (User_Name, Address, Phone_Number, Password, Email) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DbConfig.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, userName);
            stmt.setString(2, address);
            stmt.setString(3, phoneNumber);
            stmt.setString(4, password);
            stmt.setString(5, email);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
        		request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                response.sendRedirect("register.jsp?error=Registration failed, please try again.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Database error: " + e.getMessage());
        }
    }
}
