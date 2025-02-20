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
            background-color: white;
            color: black;
        }
        .call-section {
            background-color: #ffc727;
            text-align: center;
            padding: 50px 0;
            font-weight: bold;
        }
        .call-section h1 {
            font-size: 36px;
            margin: 10px 0;
        }
        .main-footer {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
            padding: 50px 20px;
            max-width: 1200px;
            margin: auto;
        }
        .footer-section {
            padding: 10px;
        }
        .footer-section h1 {
            font-size: 20px;
            font-weight: bold;
            padding-bottom: 10px;
            border-bottom: 4px solid #ffc727;
        }
        .footer-section p, .footer-section a {
            font-size: 14px;
            color: black;
            text-decoration: none;
        }
        .footer-section a:hover {
            color: #ffc727;
        }
        .social-icons a {
            font-size: 20px;
            margin-right: 15px;
            color: #ffc727;
        }
        .contact-info div {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 10px;
        }
        .contact-info i {
            font-size: 20px;
            color: #ffc727;
        }
        .footer-bottom {
            text-align: center;
            padding: 15px;
            font-size: 14px;
            background-color: black;
            color: white;
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
<!--        <div class="call-section">
            <p>WE ARE READY TO TAKE YOUR CALL 24 HOURS 7 DAYS!</p>
            <h1><a href="tel:+123456789">+123 456 789</a></h1>
        </div>-->

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

        <div class="footer-bottom">
            Copyright 2025. All rights reserved.
        </div>
    </div>
</body>
</html>
