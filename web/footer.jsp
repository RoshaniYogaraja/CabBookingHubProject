<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Footer - Cab Booking Hub</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }
            .footer-container {
                background-color: #2f2f2f;
                color: white;
            }
            .call-section {
                background-color: #ff9800;
                text-align: center;
                padding: 50px 0;
                font-weight: bold;
            }
            .call-section h1 {
                font-size: 36px;
                margin: 10px 0;
                color: white;
            }
            .main-footer {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 30px;
                padding: 50px 20px;
                max-width: 1200px;
                margin: auto;
                background-color: #333;
            }
            .footer-section {
                padding: 10px;
            }
            .footer-section h1 {
                font-size: 20px;
                font-weight: bold;
                padding-bottom: 10px;
                border-bottom: 4px solid #ff9800;
                color: #ff9800;
            }
            .footer-section p, .footer-section a {
                font-size: 14px;
                color: #d1d1d1;
                text-decoration: none;
                margin-bottom: 10px;
            }
            .footer-section a:hover {
                color: #ff9800;
            }
            .social-icons a {
                font-size: 20px;
                margin-right: 15px;
                color: #ff9800;
                transition: color 0.3s ease;
            }
            .social-icons a:hover {
                color: #fff;
            }
            .contact-info div {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 10px;
            }
            .contact-info i {
                font-size: 20px;
                color: #ff9800;
            }
            .footer-bottom {
                text-align: center;
                padding: 15px;
                font-size: 14px;
                background-color: #222;
                color: white;
            }

            /* Full-Width Map Section */
            .map-container {
                width: 100%; /* Full width of the parent container */
                height: 400px; /* Adjust height as needed */
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #333;
                padding: 0; /* Remove any padding */
                margin: 0; /* Remove any margins */
            }

            .map-container iframe {
                width: 100%; /* Full width of the map container */
                height: 100%; /* Full height of the map container */
                border: none;
            }

            @media (max-width: 768px) {
                .main-footer {
                    grid-template-columns: 1fr;
                    text-align: center;
                }
                .social-icons {
                    justify-content: center;
                }
            }
        </style>
    </head>
    <body>
        <div class="footer-container">
            <div class="call-section">
                <p>WE ARE READY TO TAKE YOUR CALL 24 HOURS 7 DAYS!</p>
                <h1><a href="tel:+123456789">+123 456 789</a></h1>
            </div>

            <div class="main-footer">
                <!-- About Section -->
                <div class="footer-section">
                    <h1>About Our Cab Booking Hub</h1>
                    <p>Cab Booking Hub is your trusted partner for reliable and convenient transportation services. We are available 24/7.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-google"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>

                <!-- Download Section -->
                <div class="footer-section">
                    <h1>Download</h1>
                    <p>Get the Cab Booking Hub app and book rides instantly.</p>
                    <p><i class="fab fa-android"></i> Android Users - Available on Google Play</p>
                    <p><i class="fab fa-apple"></i> iOS Users - Available on the App Store</p>
                </div>

                <!-- Contact Section -->
                <div class="footer-section contact-info">
                    <h1>Contact</h1>
                    <div><i class="fas fa-map-marker-alt"></i> <a href="#">1st Street, Colombo, Sri Lanka</a></div>
                    <div><i class="fas fa-phone"></i> <a href="tel:+123456789">+123 456 789</a></div>
                    <div><i class="fas fa-envelope"></i> <a href="mailto:cabbookinghub@gmail.com">cabbookinghub@gmail.com</a></div>
                    <div><i class="fas fa-globe"></i> <a href="#">www.cabbookinghub.com</a></div>
                </div>
            </div>

            <!-- Full-Width Map Section -->
            <div class="map-container">
                <iframe 
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3958.8911715805434!2d79.8590129147731!3d6.927079895002936!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae259285fe90f1b%3A0x9d564937d39b5b74!2sColombo%2C%20Sri%20Lanka!5e0!3m2!1sen!2sus!4v1618300123456"
                    allowfullscreen=""
                    loading="lazy">
                </iframe>
            </div>

            <div class="footer-bottom">
                Copyright 2025. All rights reserved.
            </div>
        </div>
    </body>
</html>
