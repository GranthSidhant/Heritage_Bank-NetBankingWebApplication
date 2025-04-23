<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Heritage Bank</title>
<link type="image/png" sizes="32x32" rel="icon" href="icon.png">
    <!-- Bootstrap CSS -->
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
        .hero-section p {
            font-size: 1.2rem;
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #d32f2f; /* Red button */
            border: none;
            padding: 10px 30px;
            font-size: 1.1rem;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #b71c1c; /* Darker red on hover */
        }
        .features-section {
            padding: 50px 0;
            background: #ffffff; /* White background */
            margin-top: 50px;
        }
        .feature-card {
            background: #eeeeee; /* Light grey card */
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-10px);
        }
        .footer {
            background: #d32f2f; /* Red footer */
            padding: 20px 0;
            text-align: center;
            margin-top: 50px;
            color: #ffffff; /* White text */
        }
        .modal-content {
            background: #ffffff; /* White modal */
            color: #333; /* Dark grey text */
        }
        .tool-section {
            padding: 50px 0;
            background: #f5f5f5; /* Light grey background */
        }
        .tool-card {
            background: #ffffff; /* White card */
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .result {
            margin-top: 20px;
            font-weight: bold;
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
                        <a class="nav-link active" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
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
        <h1>Welcome to Heritage Bank</h1>
        <p>Your trusted partner in financial growth and security.</p>
        <!-- Login and Register Buttons -->
        <a href="login.jsp" class="btn btn-primary">Login</a>
        <a href="register.jsp" class="btn btn-primary">Register</a>
    </div>
</section>

    <!-- Banking Tools Section -->
    <section class="tool-section">
        <div class="container">
            <h2 class="text-center mb-4">Banking Tools</h2>
            <div class="row">
                <!-- Loan EMI Calculator -->
                <div class="col-md-4">
                    <div class="tool-card">
                        <h3>Loan EMI Calculator</h3>
                        <form id="emiForm">
                            <div class="mb-3">
                                <label for="loanAmount" class="form-label">Loan Amount (₹)</label>
                                <input type="number" class="form-control" id="loanAmount" name="loanAmount" required>
                            </div>
                            <div class="mb-3">
                                <label for="interestRate" class="form-label">Interest Rate (%)</label>
                                <input type="number" step="0.1" class="form-control" id="interestRate" name="interestRate" required>
                            </div>
                            <div class="mb-3">
                                <label for="loanTenure" class="form-label">Loan Tenure (Years)</label>
                                <input type="number" class="form-control" id="loanTenure" name="loanTenure" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Calculate EMI</button>
                        </form>
                        <div id="emiResult" class="result"></div>
                    </div>
                </div>

                <!-- Currency Converter -->
                <div class="col-md-4">
                    <div class="tool-card">
                        <h3>Currency Converter</h3>
                        <form id="currencyForm">
                            <div class="mb-3">
                                <label for="amount" class="form-label">Amount</label>
                                <input type="number" class="form-control" id="amount" name="amount" required>
                            </div>
                            <div class="mb-3">
                                <label for="fromCurrency" class="form-label">From Currency</label>
                                <select class="form-control" id="fromCurrency" name="fromCurrency" required>
                                    <option value="USD">USD</option>
                                    <option value="EUR">EUR</option>
                                    <option value="INR">INR</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="toCurrency" class="form-label">To Currency</label>
                                <select class="form-control" id="toCurrency" name="toCurrency" required>
                                    <option value="USD">USD</option>
                                    <option value="EUR">EUR</option>
                                    <option value="INR">INR</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Convert</button>
                        </form>
                        <div id="currencyResult" class="result"></div>
                    </div>
                </div>

                <!-- Fixed Deposit Calculator -->
                <div class="col-md-4">
                    <div class="tool-card">
                        <h3>Fixed Deposit Calculator</h3>
                        <form id="fdForm">
                            <div class="mb-3">
                                <label for="principal" class="form-label">Principal Amount (₹)</label>
                                <input type="number" class="form-control" id="principal" name="principal" required>
                            </div>
                            <div class="mb-3">
                                <label for="fdInterestRate" class="form-label">Interest Rate (%)</label>
                                <input type="number" step="0.1" class="form-control" id="fdInterestRate" name="fdInterestRate" required>
                            </div>
                            <div class="mb-3">
                                <label for="fdTenure" class="form-label">Tenure (Years)</label>
                                <input type="number" class="form-control" id="fdTenure" name="fdTenure" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Calculate</button>
                        </form>
                        <div id="fdResult" class="result"></div>
                    </div>
                </div>
            </div>
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

<script>
        // Function to handle form submission
        async function handleFormSubmit(event, url, resultId) {
            event.preventDefault(); // Prevent page reload

            const formData = new URLSearchParams(new FormData(event.target)); // Convert form data to URL-encoded format

            const response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded' // Set the correct content type
                },
                body: formData
            });

            const result = await response.text(); // Get response text
            document.getElementById(resultId).innerHTML = result; // Display result
        }

        // Attach event listeners to forms
        document.getElementById('emiForm').addEventListener('submit', (event) => {
            handleFormSubmit(event, 'calculateEMI.jsp', 'emiResult');
        });

        document.getElementById('currencyForm').addEventListener('submit', (event) => {
            handleFormSubmit(event, 'convertCurrency.jsp', 'currencyResult');
        });

        document.getElementById('fdForm').addEventListener('submit', (event) => {
            handleFormSubmit(event, 'calculateFD.jsp', 'fdResult');
        });
    </script>
</body>
</html>