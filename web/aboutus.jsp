<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100vh;
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
            background-color: rgba(0, 0, 0, 0.8);
        }
        .content {
            color: white;
            text-align: center;
            padding: 20px;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        .icon {
            font-size: 24px;
            color: gold;
        }
    </style>
</head>
<body>
    
    <div class="bg-container">
        <div class="content">
            <p class="text-primary" style="font-size: 24px; font-weight: bold; text-transform: uppercase;">We do Best</p>
            <h1 style="font-size: 36px; font-weight: bold;">Than You Wish</h1>
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
                    <p>Count on us for punctual and dependable rides.</p>
                </div>
                <div class="card">
                    <span class="icon">&#9733;</span>
                    <h2>Affordable Pricing</h2>
                    <p>Enjoy competitive and transparent pricing.</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>