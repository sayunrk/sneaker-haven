package com.sneaker.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.sneaker.controller.LoginController;
import com.sneaker.models.User;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        if (userName == null || userName.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Please enter both username and password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        LoginController loginController = new LoginController();
        User user = loginController.authenticateUser(userName, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("role", user.getRole());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes timeout

            // ✅ Debug prints
            System.out.println("Session created:");
            System.out.println("  userId: " + session.getAttribute("userId"));
            System.out.println("  userName: " + session.getAttribute("userName"));
            System.out.println("  role: " + session.getAttribute("role"));

            if ("admin".equals(user.getRole())) {
                response.sendRedirect("Home.jsp");
            } else {
                response.sendRedirect("Home.jsp");
            }
        } else {
            System.out.println("Login failed for username: " + userName); 
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
