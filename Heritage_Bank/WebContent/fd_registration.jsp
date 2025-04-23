<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Open a Fixed Deposit - Heritage Bank</title>
    <link type="image/png" sizes="32x32" rel="icon" href="icon.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: #f5f5f5;
            color: #333;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background: #d32f2f;
        }
        .fd-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .fd-container h1 {
            color: #d32f2f;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #d32f2f;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #b71c1c;
        }
        .footer {
            background: #d32f2f;
            padding: 20px 0;
            text-align: center;
            color: #ffffff;
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

    <!-- FD Registration Form -->
    <div class="fd-container">
        <h1>Open a Fixed Deposit</h1>
        <form action="open_fd" method="post">
            <div class="mb-3">
                <label class="form-label">Account Number</label>
                <input type="text" class="form-control" name="accountNumber" value="<%= session.getAttribute("accountNumber") %>" readonly>
            </div>
            <div class="mb-3">
                <label class="form-label">Deposit Amount (₹)</label>
                <input type="number" class="form-control" name="amount" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Duration</label>
                <select class="form-control" name="duration" required>
                    <option value="6">6 Months</option>
                    <option value="12">12 Months</option>
                    <option value="24">24 Months</option>
                    <option value="36">36 Months</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Interest Rate</label>
                <input type="text" class="form-control" value="5.5% (Standard Rate)" readonly>
            </div>
            <button type="submit" class="btn btn-primary w-100">Submit</button>
        </form>
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
