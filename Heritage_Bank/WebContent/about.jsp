<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Heritage Bank</title>
    <link type="image/png" sizes="32x32" rel="icon" href="icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            padding: 10px 0;
            background: #ffffff; /* White background */
        }
        .content-section h2 {
            color: #d32f2f; /* Red text */
            margin-bottom: 20px;
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
            <a class="navbar-brand" href="index.jsp">Our Bank</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="services.jsp">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="about.jsp">About Us</a>
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
            <h1>About Us</h1>
            <p>Your trusted partner in financial growth and security.</p>
        </div>
    </section>

    <!-- Content Section -->
    <section class="content-section">
        <div class="container">
            <h2>Who We Are</h2>
            <p>
                Heritage Bank is a leading financial institution dedicated to providing innovative banking solutions to individuals and businesses. With a rich history spanning over 50 years, we have built a reputation for trust, reliability, and excellence.
            </p>
            <h2>Our Mission</h2>
            <p>
                Our mission is to empower our customers to achieve their financial goals by offering personalized services, cutting-edge technology, and a commitment to ethical banking practices.
            </p>
            <h2>Our Values</h2>
            <ul>
                <li><strong>Integrity:</strong> We operate with honesty and transparency.</li>
                <li><strong>Customer Focus:</strong> We prioritize the needs of our customers.</li>
                <li><strong>Innovation:</strong> We embrace technology to deliver better solutions.</li>
                <li><strong>Community:</strong> We are committed to supporting the communities we serve.</li>
            </ul>
        </div>
    </section>

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