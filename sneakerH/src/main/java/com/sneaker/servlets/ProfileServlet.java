package com.sneaker.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import com.sneaker.controller.ProfileController;
import com.sneaker.models.User;

@WebServlet("/Profile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProfileController profileController;
    private static final String UPLOAD_DIR = "Assets";

    public void init() throws ServletException {
        profileController = new ProfileController();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp?error=Please log in to view your profile");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String role = (String) session.getAttribute("role");
        if (!"admin".equals(role) && !"customer".equals(role)) {
            response.sendRedirect("login.jsp?error=Unauthorized access");
            return;
        }

        User user = profileController.getUserById(userId);
        if (user == null) {
            response.sendRedirect("login.jsp?error=User not found");
            return;
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp?error=Please log in to update your profile");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String role = (String) session.getAttribute("role");
        if (!"admin".equals(role) && !"customer".equals(role)) {
            response.sendRedirect("login.jsp?error=Unauthorized access");
            return;
        }

        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            session.invalidate();
            response.sendRedirect("login.jsp?message=Logged out successfully");
            return;
        }

        try {
            String userName = request.getParameter("userName");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("email");
            Part filePart = request.getPart("image");
            String image = null;

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + UPLOAD_DIR;
                Files.createDirectories(Paths.get(uploadPath));
                String filePath = uploadPath + "/" + fileName;
                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                }
                image = fileName;
            }

            User user = new User(userId, userName, address, phoneNumber, email, role, image);
            boolean success = profileController.updateUser(user);

            if (success) {
                request.setAttribute("message", "Profile updated successfully");
            } else {
                request.setAttribute("error", "Failed to update profile");
            }

            request.setAttribute("user", profileController.getUserById(userId));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.setAttribute("user", profileController.getUserById(userId));
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }
}