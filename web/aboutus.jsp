<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
        }
        .bg-container {
            background-image: url('assets/girl.jpg'); /* Adjust the path accordingly */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            color: white;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.6);
        }
        .content {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 40px;
            max-width: 1200px; /* Maximum width for large screens */
            width: 100%; /* Full width but constrained by max-width */
            margin: 0 auto;
        }
        .content h1 {
            font-size: 40px;
            font-weight: 700;
            text-transform: uppercase;
        }
        .content p {
            font-size: 20px;
            font-weight: 500;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            backdrop-filter: blur(10px);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card h2 {
            font-size: 24px;
            margin: 15px 0;
            font-weight: 600;
        }
        .card p {
            font-size: 16px;
            color: #ccc;
        }
        .icon {
            font-size: 40px;
            color: gold;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <div class="bg-container">
        <div class="overlay"></div>
        <div class="content">
            <p class="text-primary" style="font-size: 22px; font-weight: bold; text-transform: uppercase;">We Do Our Best</p>
            <h1>More Than You Wish</h1>
            <p>Our commitment is to provide exceptional and reliable services for every ride you take.</p>
            <div class="grid">
                <div class="card">
                    <span class="icon">&#9733;</span>
                    <h2>Fast Booking</h2>
                    <p>Experience the convenience of booking a cab in just a few clicks.</p>
                </div>
                <div class="card">
                    <span class="icon">&#9733;</span>
                    <h2>Luxury Rides</h2>
                    <p>Travel in comfort and style with our premium cab services.</p>
                </div>
                <div class="card">
                    <span class="icon">&#9733;</span>
                    <h2>Reliable Services</h2>
                    <p>Count on us for punctual and dependable rides, every time.</p>
                </div>
                <div class="card">
                    <span class="icon">&#9733;</span>
                    <h2>Affordable Pricing</h2>
                    <p>Enjoy competitive and transparent pricing for all our services.</p>
                </div>
                <div class="card">
                    <span class="icon">&#9733;</span>
                    <h2>Fast Ride</h2>
                    <p>Get to your destination quickly with our fast and efficient rides.</p>
                </div>
                <div class="card">
                    <span class="icon">&#9733;</span>
                    <h2>24/7 Availability</h2>
                    <p>We are available round-the-clock, ensuring you always have a ride when you need it.</p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
