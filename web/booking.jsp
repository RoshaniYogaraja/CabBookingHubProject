<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Book Your Cab - Cab Booking Hub</title>

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
            .booking-container {
                background: white;
                padding: 0;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                width: 100%;
                overflow: hidden;
            }

            .booking-header {
                background: black;
                color: white;
                text-align: center;
                padding: 15px;
                font-size: 18px;
                font-weight: bold;
            }

            .form-container {
                display: flex;
                flex-direction: column;
                padding: 20px;
            }

            .input-row {
                display: flex;
                justify-content: space-between;
                gap: 10px;
            }

            .inputField {
                flex: 1;
                padding: 12px;
                border: none;
                border-bottom: 1px solid #ccc;
                font-size: 14px;
                width: 100%;
                box-sizing: border-box;
                background: transparent;
                outline: none;
            }

            .book-btn {
                background: black;
                color: white;
                padding: 14px;
                border: none;
                width: 100%;
                border-radius: 0;
                cursor: pointer;
                font-size: 16px;
                margin-top: 15px;
                transition: 0.3s;
            }

            .book-btn:hover {
                background: #333;
            }

            .additional-content {
                margin-top: 50px;
                padding: 20px;
                background-color: var(--bg-color);
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            .additional-content h2 {
                font-size: 2rem;
                margin-bottom: 20px;
            }

            .additional-content p {
                font-size: 1.2rem;
                margin-bottom: 10px;
                line-height: 1.8;
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

        <div class="container main-content">
            <!-- Booking Form -->
            <div class="booking-container">
                <div class="booking-header">BOOK A CAB</div>
                <form action="BookingServlet" method="post" class="form-container">
                    <div class="input-row">
                        <input class="inputField" type="text" name="name" placeholder="Name" required>
                        <input class="inputField" type="text" name="phone" placeholder="Phone" required>
                    </div>
                    <div class="input-row">
                        <input class="inputField" type="text" name="start" placeholder="Start Location" required>
                        <input class="inputField" type="text" name="end" placeholder="End Location" required>
                    </div>
                    <input class="inputField" type="text" name="vehicle" placeholder="Choose a Vehicle" required>
                    <button type="submit" class="book-btn">BOOK NOW</button>
                </form>
            </div>

            <!-- Additional Content Section -->
            <div class="additional-content">
                <h2>Why Choose Us?</h2>
                <p>At Cab Booking Hub, we are dedicated to providing a seamless and luxurious cab booking experience. Our wide range of vehicles ensures that you find the perfect ride for your needs, whether it's a business trip, a family outing, or a special occasion.</p>
                <p>With our easy-to-use platform, you can book your cab in just a few clicks. Our drivers are professional and reliable, ensuring a safe and comfortable journey every time.</p>
                <h2>Features</h2>
                <ul>
                    <li>Luxury cars available for rent at competitive prices.</li>
                    <li>Quick and easy booking process.</li>
                    <li>Safe and secure payment options.</li>
                    <li>24/7 customer support to assist you with any queries.</li>
                </ul>
                <p>Experience the best cab booking service with Cab Booking Hub. Book your ride now and travel in style!</p>
            </div>
        </div>

    </body>
</html>
