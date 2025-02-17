<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us - Cab Booking Hub</title>
    
    <!-- Font Awesome (Latest CDN) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        :root {
            --primary-color: #ffc727;
            --secondary-color: #000;
            --text-color: #333;
            --bg-color: #f9f9f9;
        }
        body {
            font-family: 'Arial', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            line-height: 1.6;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        .call-section {
            background-color: var(--primary-color);
            color: var(--secondary-color);
            text-align: center;
            padding: 50px 0;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .call-section p {
            font-size: 1.2rem;
            margin-bottom: 15px;
            font-weight: 500;
        }
        .call-section h1 {
            font-size: 3.5rem;
            font-weight: 700;
        }
        .call-section a {
            color: var(--secondary-color);
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .call-section a:hover {
            color: #444;
        }
        .main-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            padding: 50px 15px;
            background-color: white;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }
        .section-title {
            position: relative;
            padding-bottom: 15px;
            margin-bottom: 30px;
            font-size: 1.8rem;
            font-weight: 700;
        }
        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 80px;
            height: 8px;
            background-color: var(--primary-color);
        }
        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            transition: border-color 0.3s ease;
        }
        .contact-form input:focus,
        .contact-form textarea:focus {
            outline: none;
            border-color: var(--primary-color);
        }
        .contact-form textarea {
            resize: vertical;
            min-height: 150px;
        }
        .contact-form button {
            width: 100%;
            padding: 15px;
            background-color: var(--primary-color);
            color: var(--secondary-color);
            border: none;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .contact-form button:hover {
            background-color: #ffdc4d;
        }
        .contact-info .info-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            gap: 15px;
        }
        .contact-info .info-item i {
            font-size: 1.5rem;
            color: var(--primary-color);
            width: 40px;
            text-align: center;
        }
        .contact-info a {
            color: var(--text-color);
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .contact-info a:hover {
            color: var(--primary-color);
        }
        .footer {
            background-color: var(--secondary-color);
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 0.9rem;
        }
        @media (max-width: 768px) {
            .main-content {
                grid-template-columns: 1fr;
                gap: 30px;
            }
            .call-section h1 {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <%--<jsp:include page="header.jsp" />--%>

    <div class="call-section">
        <div class="container">
            <p>WE ARE READY TO TAKE YOUR CALL 24 HOURS 7 DAYS!</p>
            <h1><a href="tel:+123456789">+123 456 789</a></h1>
        </div>
    </div>

    <div class="container main-content">
        <!-- Contact Form -->
        <div class="contact-form">
            <h1 class="section-title">Contact Us</h1>
            <form action="contactus_handler.jsp" method="POST">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <input type="text" name="subject" placeholder="Subject" required>
                <textarea name="message" placeholder="Your Message" required></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>

        <!-- Contact Information -->
        <div class="contact-info">
            <h1 class="section-title">Contact Information</h1>
            <div class="info-item">
                <i class="fa-solid fa-phone"></i>
                <a href="tel:+123456789">+123 456 789</a>
            </div>
            <div class="info-item">
                <i class="fa-solid fa-envelope"></i>
                <a href="mailto:cabbookinghub@gmail.com">cabbookinghub@gmail.com</a>
            </div>
            <div class="info-item">
                <i class="fa-brands fa-facebook"></i>
                <a href="https://www.facebook.com" target="_blank">Facebook</a>
            </div>
            <div class="info-item">
                <i class="fa-brands fa-instagram"></i>
                <a href="https://www.instagram.com" target="_blank">Instagram</a>
            </div>
            <div class="info-item">
                <i class="fa-brands fa-google"></i>
                <a href="https://www.google.com" target="_blank">Google</a>
            </div>
            <div class="info-item">
                <i class="fa-brands fa-twitter"></i>
                <a href="https://www.twitter.com" target="_blank">Twitter</a>
            </div>
        </div>
    </div>

</body>
</html>

