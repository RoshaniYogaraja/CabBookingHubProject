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
                background-color: #000;
                color: white;
            }
            .main-footer {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 30px;
                padding: 50px 20px;
                max-width: 1200px;
                margin: auto;
                background-color: #000;
            }
            .footer-section {
                padding: 10px;
            }
            .footer-section h1 {
                font-size: 24px;
                font-weight: bold;
                padding-bottom: 10px;
                border-bottom: 4px solid #ffcc00;
                color: #ffcc00;
            }
            .footer-section p, .footer-section a {
                font-size: 16px;
                color: #d1d1d1;
                text-decoration: none;
                margin-bottom: 10px;
            }
            .footer-section a:hover {
                color: #ffcc00;
            }
            .social-icons a {
                font-size: 24px;
                margin-right: 15px;
                color: #ffcc00;
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
                font-size: 24px;
                color: #ffcc00;
            }
            .footer-bottom {
                text-align: center;
                padding: 20px;
                font-size: 16px;
                background-color: #111;
                color: white;
            }

            .map-container {
                width: 100%;
                height: 400px;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #000;
                padding: 0;
                margin: 0;
            }

            .map-container iframe {
                width: 100%;
                height: 100%;
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
            <div class="main-footer">
                <div class="footer-section">
                    <h1>About Our Cab Booking Hub</h1>
                    <p>Cab Booking Hub is your trusted partner for reliable and convenient transportation services. We are dedicated to providing a seamless and safe travel experience, available 24/7.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-google"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                    </div>
                </div>
                <div class="footer-section">
                    <h1>Download</h1>
                    <p>Get the Cab Booking Hub app and book rides instantly from your smartphone. Available on Android and iOS.</p>
                    <p><i class="fab fa-android"></i> <strong>Android Users</strong> - Available on Google Play</p>
                    <p><i class="fab fa-apple"></i> <strong>iOS Users</strong> - Available on the App Store</p>
                </div>
                <div class="footer-section contact-info">
                    <h1>Contact</h1>
                    <div><i class="fas fa-map-marker-alt"></i> <a href="#">1st Street, Colombo, Sri Lanka</a></div>
                    <div><i class="fas fa-phone"></i> <a href="tel:+123456789">+123 456 789</a></div>
                    <div><i class="fas fa-envelope"></i> <a href="mailto:cabbookinghub@gmail.com">cabbookinghub@gmail.com</a></div>
                    <div><i class="fas fa-globe"></i> <a href="#">www.cabbookinghub.com</a></div>
                </div>
            </div>
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
