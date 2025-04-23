<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Heritage Bank</title>
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
            padding: 30px 0;
            background: #ffffff; /* White background */
        }
        .content-section h2 {
            color: #d32f2f; /* Red text */
            margin-bottom: 20px;
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
                    <li class="nav-item">
                        <a class="nav-link" href="services.jsp">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About Us</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1>Contact Us</h1>
            <p>We're here to help. Reach out to us for any inquiries or support.</p>
        </div>
    </section>

    <!-- Content Section -->
    <section class="content-section">
        <div class="container">
            <h2>Get in Touch</h2>
            <p>
                Have questions or need assistance? Our team is ready to help you. You can reach us through the following channels:
            </p>
            <ul>
                <li><strong>Phone:</strong> +1 (123) 456-7890</li>
                <li><strong>Email:</strong> support@heritagebank.com</li>
                <li><strong>Address:</strong> 123 Main Street, Cityville, Country</li>
            </ul>
            <h2>Send Us a Message</h2>
            <form id="contactForm">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Message</label>
                    <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Message</button>
            </form>
            <div id="contactMessage" class="alert mt-3" style="display: none;"></div>
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
    <!-- Custom JavaScript for Contact Form -->
    <script>
        document.getElementById('contactForm').addEventListener('submit', async (event) => {
            event.preventDefault(); // Prevent page reload

            const formData = new URLSearchParams(new FormData(event.target)); // Get form data

            const response = await fetch('contact', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: formData
            });

            const result = await response.text(); // Get response text

            // Display contact message
            const contactMessage = document.getElementById('contactMessage');
            contactMessage.style.display = 'block';
            if (result === 'success') {
                contactMessage.innerHTML = 'Your message has been sent successfully!';
                contactMessage.classList.remove('alert-danger');
                contactMessage.classList.add('alert-success');
            } else {
                contactMessage.innerHTML = 'Failed to send your message. Please try again.';
                contactMessage.classList.remove('alert-success');
                contactMessage.classList.add('alert-danger');
            }
        });
    </script>
</body>
</html>