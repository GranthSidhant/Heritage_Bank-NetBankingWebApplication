package com.netbanking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String query = "SELECT * FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            
            HttpSession session = request.getSession();

         // Fetch user details from the database
         if (rs.next()) {  // Assuming you have executed a query to fetch user details
             int userId = rs.getInt("u_id");  // Fetch user ID
             String userName = rs.getString("username");

             session.setAttribute("u_id", userId); // ✅ Store user ID
             session.setAttribute("username", userName); // ✅ Store username separately

             response.sendRedirect("dashboard.jsp"); // Redirect to dashboard or home page
         } else {
             response.sendRedirect("login.jsp?error=Invalid credentials"); // Redirect if login fails
         }

            
            
            
            
            
//            if (rs.next()) {
//                // Login successful
//                HttpSession session = request.getSession();
//                session.setAttribute("username", username);
//                response.sendRedirect("dashboard.jsp?success=1"); // Redirect to login with success message
//            } else {
//                // Login failed
//                response.sendRedirect("login.jsp?error=1"); // Redirect with error
//            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=1"); // Redirect with generic error
        }
    }
}