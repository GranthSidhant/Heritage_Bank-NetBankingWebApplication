<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.netbanking.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Heritage Bank</title>
    <link type="image/png" sizes="32x32" rel="icon" href="icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body { background: #f5f5f5; font-family: 'Arial', sans-serif; }
        .navbar { background: #d32f2f; }
        .dashboard-container { max-width: 1200px; margin: 50px auto; padding: 20px; background: #ffffff; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
        .dashboard-container h1 { color: #d32f2f; font-weight: bold; }
        .card { padding: 20px; border-radius: 10px; margin-bottom: 20px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); transition: transform 0.3s ease; }
        .card:hover { transform: translateY(-10px); }
        .icon { font-size: 2rem; color: #d32f2f; }
        .btn-primary { background-color: #d32f2f; border: none; padding: 10px 20px; }
        .btn-primary:hover { background-color: #b71c1c; }
        .footer { background: #d32f2f; padding: 20px 0; text-align: center; color: #ffffff; }
        .recent-transactions {
    max-height: 250px; /* Set max height */
    overflow-y: auto; /* Enable vertical scroll */
}
.card {
    min-height: 250px; /* Ensure equal height for all cards */
}
        
    </style>
</head>
<body>

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
                    <li class="nav-item"><a class="nav-link" href="user_details.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

<%
    // Get user ID from session
    Integer userId = (Integer) session.getAttribute("u_id"); 
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String fullName = "";
    double balance = 0.00;
    List<Map<String, String>> transactions = new ArrayList<>();

    try (Connection conn = DBConnection.getConnection()) {
        // Fetch user details
        String userQuery = "SELECT full_name, balance FROM users WHERE u_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(userQuery)) {
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    fullName = rs.getString("full_name");
                    balance = rs.getDouble("balance");
                }
            }
        }

        // Fetch last 5 transactions
        String txnQuery = "SELECT type, amount, description, transaction_date FROM transactions WHERE u_id = ? ORDER BY transaction_date DESC LIMIT 5";
        try (PreparedStatement pstmt = conn.prepareStatement(txnQuery)) {
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> txn = new HashMap<>();
                    txn.put("type", rs.getString("type"));
                    txn.put("amount", String.format("₹%.2f", rs.getDouble("amount")));
                    txn.put("description", rs.getString("description"));
                    txn.put("date", rs.getTimestamp("transaction_date").toString());
                    transactions.add(txn);
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

    <!-- Dashboard Content -->
    <div class="dashboard-container">
        <h1>Welcome, <%= fullName %>!</h1>
        <div class="row">
            <!-- Account Summary Card -->
            <div class="col-md-4" class="icon">
                <div class="card text-center">
                    <div class="icon"><i class="fas fa-wallet"></i></div>
                    <h3>Account Summary</h3>
                    <p><strong>Balance:</strong> ₹<%= String.format("%.2f", balance) %></p>
                    <a href="user_details.jsp" class="btn btn-primary">View Details</a>
                </div>
            </div>

            <!-- Recent Transactions Card -->
            <div class="col-md-4">
    <div class="card text-center">
        <div class="icon"><i class="fas fa-exchange-alt"></i></div>
        <h3>Recent Transactions</h3>
        <div class="recent-transactions">
            <% if (!transactions.isEmpty()) { %>
                <ul class="list-unstyled">
                    <% for (Map<String, String> txn : transactions) { %>
                        <li>
                            <strong><%= txn.get("type") %></strong><br>
                            <%= txn.get("amount") %> - <%= txn.get("description") %><br>
                            <small><%= txn.get("date") %></small>
                        </li>
                        <hr>
                    <% } %>
                </ul>
            <% } else { %>
                <p>No recent transactions.</p>
            <% } %>
        </div>
        <a href="passbook.jsp" class="btn btn-primary">View All</a>
    </div>
</div>


            <!-- Quick Actions Card -->
            <div class="col-md-4" class="icon">
                <div class="card text-center">
                    <div class="icon"><i class="fas fa-tasks"></i></div>
                    <h3>Quick Actions</h3>
                    <ul class="list-unstyled">
                        <li><a href="deposit.jsp" class="btn btn-primary btn-sm mb-2">Deposit Money</a></li>
                        <li><a href="withdraw.jsp" class="btn btn-primary btn-sm mb-2">Withdraw Money</a></li>
                        <li><a href="fd_registration.jsp" class="btn btn-primary btn-sm mb-2">Open a FD</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2025 Heritage Bank. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
