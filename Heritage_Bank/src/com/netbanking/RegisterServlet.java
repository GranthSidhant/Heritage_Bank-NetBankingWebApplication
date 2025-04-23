package com.netbanking;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String query = "INSERT INTO users (full_name, email, username, password) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            // Set parameters for the query
            pstmt.setString(1, fullName);
            pstmt.setString(2, email);
            pstmt.setString(3, username);
            pstmt.setString(4, password);

            // Execute the query
            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                // Registration successful
                response.sendRedirect("login.jsp?success=1"); // Redirect to login with success message
            } else {
                // Registration failed (no rows inserted)
                response.sendRedirect("register.jsp?error=1"); // Redirect with error
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle specific SQL exceptions (e.g., duplicate username or email)
            if (e.getMessage().contains("Duplicate entry")) {
                response.sendRedirect("register.jsp?error=2"); // Redirect with duplicate error
            } else {
                response.sendRedirect("register.jsp?error=1"); // Redirect with generic error
            }
        }
    }
}