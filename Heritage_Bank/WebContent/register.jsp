<%
    String error = request.getParameter("error");
    String success = request.getParameter("success");

    if (error != null) {
        if (error.equals("1")) {
            out.println("<div class='alert alert-danger'>Registration failed. Please try again.</div>");
        } else if (error.equals("2")) {
            out.println("<div class='alert alert-danger'>Username or email already exists. Please use a different one.</div>");
        }
    }

    if (success != null && success.equals("1")) {
        out.println("<div class='alert alert-success'>Registration successful! Please login.</div>");
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Our Bank</title>
     <link type="image/png" sizes="32x32" rel="icon" href="icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f5f5f5; /* Light grey background */
            color: #333; /* Dark grey text */
            font-family: 'Arial', sans-serif;
        }
        .register-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background: #ffffff; /* White background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .register-container h2 {
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
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Create a New Account</h2>
        <form id="registerForm" action="RegisterServlet" method="post">
            <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="mb-3">
                <label for="type" class="form-label">Account Type</label>
                <br>
                <input type="radio" class="" id="accountType" name="accountType" required> &nbsp;Savings&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                <input type="radio" class="" id="accountType" name="accountType" required> &nbsp;Current
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
        <div id="registerMessage" class="alert" style="display: none;"></div>
        <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login here</a></p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>