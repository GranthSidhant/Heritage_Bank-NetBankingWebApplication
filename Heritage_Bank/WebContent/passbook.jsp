<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.netbanking.DBConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Details</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5; /* Light grey background */
            color: #333; /* Dark grey text */
        }
        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff; /* White background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #d32f2f; /* Red text */
            margin-bottom: 20px;
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #d32f2f; /* Red header */
            color: #fff;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
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
        a:hover {
            background-color: #b71c1c; /* Darker red on hover */
        }
        .footer {
            background: #d32f2f; /* Red footer */
            padding: 20px 0;
            text-align: center;
            color: #ffffff; /* White text */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Transaction Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Transaction Type</th>
                    <th>Amount</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <%
                    boolean hasData = false;
                try (Connection conn = DBConnection.getConnection();
                     PreparedStatement pstmt = conn.prepareStatement("SELECT type, amount, description, transaction_date FROM transactions WHERE u_id = ? ORDER BY transaction_date DESC")) {

                    Object userIdObj = session.getAttribute("u_id");
                    if (userIdObj == null) {
                        response.sendRedirect("login.jsp");
                        return;
                    }

                    int userId;
                    try {
                        userId = Integer.parseInt(userIdObj.toString());
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        response.sendRedirect("login.jsp");
                        return;
                    }

                    pstmt.setInt(1, userId);
                    ResultSet rs = pstmt.executeQuery();

                    while (rs.next()) {
                        hasData = true;
                %>
                <tr>
                    <td><%= rs.getString("transaction_date") %></td>
                    <td><%= rs.getString("type") %></td>
                    <td>₹<%= rs.getDouble("amount") %></td>
                    <td><%= rs.getString("description") %></td>
                </tr>
                <%
                    }

                    if (!hasData) {
                %>
                <tr>
                    <td colspan="4" style="text-align: center; color: gray;">No transactions found.</td>
                </tr>
                <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                %>
                <tr>
                    <td colspan="4" style="text-align: center; color: red;">Error retrieving data. Please try again later.</td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <a href="index.jsp">Go Back to Home</a>
    </div>
</body>
</html>