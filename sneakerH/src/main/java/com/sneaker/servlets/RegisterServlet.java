package com.sneaker.servlets;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.sneaker.controller.RegisterController;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        System.out.println("RegisterServlet: Received Data ->");
        System.out.println("userName: " + userName);
        System.out.println("address: " + address);
        System.out.println("phoneNumber: " + phoneNumber);
        System.out.println("email: " + email);
        System.out.println("password: " + password);
        System.out.println("confirmPassword: " + confirmPassword);

        if (userName == null || userName.isEmpty() ||
            address == null || address.isEmpty() ||
            phoneNumber == null || phoneNumber.isEmpty() ||
            email == null || email.isEmpty() ||
            password == null || password.isEmpty() ||
            confirmPassword == null || confirmPassword.isEmpty()) {
            System.out.println("Validation Failed: One or more fields are empty.");
            response.sendRedirect("register.jsp?error=Please fill in all fields");
            return;
        }

        if (!password.equals(confirmPassword)) {
            System.out.println("Validation Failed: Passwords do not match.");
            response.sendRedirect("register.jsp?error=Passwords do not match");
            return;
        }

        System.out.println("Validation Passed: Attempting to register user...");

        boolean success = RegisterController.registerUser(userName, address, phoneNumber, password, email);

        if (success) {
            System.out.println("Registration successful.");
            response.sendRedirect("login.jsp?message=Registration successful, please login");
        } else {
            System.out.println("Registration failed at controller.");
            response.sendRedirect("register.jsp?error=Registration failed, please try again");
        }
    }

    }
