<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Heritage Bank</title>
    <link type="image/png" sizes="32x32" rel="icon" href="icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f5f5f5; /* Light grey background */
            color: #333; /* Dark grey text */
            font-family: 'Arial', sans-serif;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background: #ffffff; /* White background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
            color: #d32f2f; /* Red text */
            text-align: center;
            margin-bottom: 20px;
        }
        .form-control {
            border-radius: 5px;
            border: 1px solid #ddd;
            padding: 10px;
        }
        .form-control:focus {
            border-color: #d32f2f; /* Red border on focus */
            box-shadow: 0 0 5px rgba(211, 47, 47, 0.5);
        }
        .btn-primary {
            background-color: #d32f2f; /* Red button */
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        .btn-primary:hover {
            background-color: #b71c1c; /* Darker red on hover */
        }
        .alert {
            margin-bottom: 20px;
            border-radius: 5px;
            padding: 10px 15px;
        }
        .alert-danger {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
        }
        .alert-success {
            background-color: #d4edda;
            border-color: #c3e6cb;
            color: #155724;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login to Your Account</h2>
        
        <%
        String error = request.getParameter("error");
        if (error != null) {
            String errorMessage = "";
            switch(error) {
                case "empty":
                    errorMessage = "Please enter both username and password.";
                    break;
                case "invalid":
                    errorMessage = "Invalid username or password.";
                    break;
                case "database":
                    errorMessage = "Database error occurred. Please try again later.";
                    break;
                default:
                    errorMessage = "An error occurred. Please try again.";
            }
        %>
            <div class="alert alert-danger">
                <%= errorMessage %>
            </div>
        <%
        }
        
        String success = request.getParameter("success");
        if (success != null && success.equals("registered")) {
        %>
            <div class="alert alert-success">
                Registration successful! Please login with your credentials.
            </div>
        <%
        }
        %>

        <form id="loginForm" action="LoginServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
        <p class="text-center mt-3">Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>