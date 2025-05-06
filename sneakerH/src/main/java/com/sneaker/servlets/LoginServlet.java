package com.sneaker.servlets;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import com.sneaker.controller.LoginController;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        if (userName == null || userName.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=Please enter both username and password");
            return;
        }

        LoginController loginController = new LoginController();
        boolean isAuthenticated = loginController.authenticateUser(userName, password);

        if (isAuthenticated) {
            response.sendRedirect("Home.jsp");
        } else {
            response.sendRedirect("login.jsp?error=Invalid username or password");
        }
    }
}
