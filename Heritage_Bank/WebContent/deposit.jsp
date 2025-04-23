<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.netbanking.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Money</title>
    <link type="image/png" sizes="32x32" rel="icon" href="icon.png">
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f5f5f5; /* Light grey background */
            color: #333; /* Dark grey text */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 500px;
            width: 100%;
            padding: 20px;
            background: #ffffff; /* White background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #d32f2f; /* Red text */
            margin-bottom: 20px;
            font-weight: bold;
        }
        form {
            margin-top: 20px;
        }
        input {
            padding: 10px;
            width: 80%;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        button {
            padding: 10px 20px;
            background-color: #d32f2f; /* Red button */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #b71c1c; /* Darker red on hover */
        }
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #d32f2f; /* Red button */
            color: #fff;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .back-btn:hover {
            background-color: #b71c1c; /* Darker red on hover */
        }
        p {
            margin: 10px 0;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Deposit Money</h2>
    <form method="post">
        <input type="number" name="amount" placeholder="Enter deposit amount" required step="0.01" min="0.01"><br>
        <button type="submit">Deposit</button>
    </form>

    <%
    // Retrieve user ID from session
    Integer userId = (Integer) session.getAttribute("u_id"); 
    if (userId == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if session is null
        return;
    }

    if (request.getMethod().equals("POST")) {
        double amount = Double.parseDouble(request.getParameter("amount"));

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            // Update balance
            String updateBalance = "UPDATE users SET balance = balance + ? WHERE u_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(updateBalance)) {
                pstmt.setDouble(1, amount);
                pstmt.setInt(2, userId);
                pstmt.executeUpdate();
            }

            // Insert transaction record
            String insertTransaction = "INSERT INTO transactions (u_id, type, amount, description) VALUES (?, 'DEPOSIT', ?, 'Money Deposited')";
            try (PreparedStatement pstmt = conn.prepareStatement(insertTransaction)) {
                pstmt.setInt(1, userId);
                pstmt.setDouble(2, amount);
                pstmt.executeUpdate();
            }

            conn.commit();
            out.println("<p style='color:green;'>Deposit Successful!</p>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p style='color:red;'>Transaction failed!</p>");
        }
    }
    %>

    <!-- Back to Dashboard Button -->
    <a href="dashboard.jsp" class="back-btn">Back to Dashboard</a>
</div>

</body>
</html>