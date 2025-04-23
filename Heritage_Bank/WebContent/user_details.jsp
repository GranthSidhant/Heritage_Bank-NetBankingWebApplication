<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Heritage Bank</title>
    <link type="image/png" sizes="32x32" rel="icon" href="icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: #f5f5f5;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background: #d32f2f;
        }
        .profile-container {
            max-width: 700px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-container h1 {
            color: #d32f2f;
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-info {
            list-style: none;
            padding: 0;
        }
        .profile-info li {
            padding: 10px 15px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            font-size: 1.1rem;
        }
        .profile-info li:last-child {
            border-bottom: none;
        }
        .profile-info strong {
            color: #d32f2f;
        }
        .btn-edit {
        color : white;
            background-color: #d32f2f;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        .btn-edit:hover {
            background-color: #b71c1c;
        }
        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background: #d32f2f;
            padding: 20px 0;
            text-align: center;
            color: #ffffff;
        }
    </style>
</head>
<body>

<%
    // Get user ID from session
    Integer userId = (Integer) session.getAttribute("u_id"); 
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/bankdb";
    String user = "root";
    String password = "123456";

    // User details variables
    String username = "";
    String fullName = "";
    String email = "";
    double balance = 0.00;

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            // Fetch user details
            String userQuery = "SELECT username, full_name, email, balance FROM users WHERE u_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(userQuery)) {
                pstmt.setInt(1, userId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        username = rs.getString("username");
                        fullName = rs.getString("full_name");
                        email = rs.getString("email");
                        balance = rs.getDouble("balance");
                    }
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Heritage Bank</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="passbook.jsp">Transactions</a></li>
                    <li class="nav-item"><a class="nav-link active" href="user_details.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Profile Section -->
    <div class="profile-container">
        <h1>User Profile</h1>
        <ul class="profile-info">
            <li><strong>Account Number:</strong> <span>90050066<%= userId%></span></li>
            <li><strong>Username</strong> <span><%= username %></span></li>
            <li><strong>Name:</strong> <span><%=  fullName%></span></li>
            <li><strong>Email:</strong> <span><%= email%></span></li>
            <li><strong>Balance:</strong> <span>₹<%= balance %></span></li>
        </ul>
        <div class="text-center mt-3">
            <a href="dashboard.jsp" class="btn btn-edit">BACK</a>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Heritage Bank. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
