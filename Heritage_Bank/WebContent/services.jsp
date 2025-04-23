<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services - Heritage Bank</title>
    <link type="image/png" sizes="32x32" rel="icon" href="icon.png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: #f5f5f5; /* Light grey background */
            color: #333; /* Dark grey text */
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background: #d32f2f; /* Red navbar */
        }
        .hero-section {
            padding: 80px 0;
            text-align: center;
            background: #ffffff; /* White background */
            color: #d32f2f; /* Red text */
        }
        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: bold;
        }
        .content-section {
            padding: 50px 0;
            background: #ffffff; /* White background */
        }
        .content-section h2 {
            color: #d32f2f; /* Red text */
            margin-bottom: 20px;
        }
        .service-card {
            background: #eeeeee; /* Light grey card */
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }
        .service-card:hover {
            transform: translateY(-10px);
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
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Heritage Bank</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="services.jsp">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1>Our Services</h1>
            <p>Explore the wide range of financial services we offer.</p>
        </div>
    </section>

    <!-- Content Section -->
    <section class="content-section">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="service-card">
                        <h3>Personal Banking</h3>
                        <p>
                            Manage your finances with our personal banking services, including savings accounts, loans, and credit cards.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <h3>Business Banking</h3>
                        <p>
                            Grow your business with tailored financial solutions, including business loans, merchant services, and more.
                        </p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <h3>Investment Services</h3>
                        <p>
                            Achieve your financial goals with our investment services, including mutual funds, stocks, and retirement planning.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p> &copy; 2025 Heritage Bank</p>
        </div>
    </footer>
        