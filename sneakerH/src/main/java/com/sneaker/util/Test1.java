package com.sneaker.util;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/coursework") // Careful: this is case-sensitive
public class Test1 extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        try (Connection conn = DbConfig.getConnection()) {
            if (conn != null && !conn.isClosed()) {
                out.println("<h2>✅ Database connection successful!</h2>");
                
            } else {
                out.println("<h2>❌ Connection was null or closed!</h2>");
            }
        } catch (Exception e) {
            out.println("<h2>❌ Connection failed:</h2><pre>");
            e.printStackTrace(out);
            out.println("</pre>");
        }
    }
}