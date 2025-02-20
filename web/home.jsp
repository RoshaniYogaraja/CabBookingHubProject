<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cab Booking Hero</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('assets/city1.jpg'); /* Ensure correct path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .navbar-container {
            width: 100%;
            position: absolute;
            top: 0;
            z-index: 10;
        }
        .hero-container {
            background: rgba(0, 0, 0, 0.6);
            width: 100%;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
        .hero-text p {
            font-size: 24px;
            font-weight: bold;
            text-transform: uppercase;
            color: yellow;
        }
        .hero-text h1 {
            font-size: 48px;
            font-weight: bold;
        }
        .hero-text .website {
            letter-spacing: 8px;
            font-size: 20px;
        }
        .hero-image img {
            max-height: 460px;
        }
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <div class="navbar-container">
        <jsp:include page="header.jsp" />
    </div>

    <!-- Hero Section -->
    <div class="hero-container">
        <div class="hero-text" data-aos="fade-up">
            <p>Book Cab now</p>
            <h1 data-aos-duration="600">+94 771 23456</h1>
            <p class="website" data-aos-duration="1000">www.swjshwjh.com</p>
        </div>
        <div class="hero-image" data-aos="zoom-in-right" data-aos-duration="1000">
            <img src="assets/yellow-cab.png" alt="Yellow Cab"> <!-- Ensure correct image path -->
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init({
            duration: 800,
            offset: 120,
            once: true
        });
    </script>
</body>
</html>
