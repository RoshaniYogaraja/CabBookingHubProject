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
            .booking-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                align-items: center;
                gap: 50px;
            }
            .left-section {
                flex: 1;
                padding: 20px;
            }
            .left-section h1 {
                font-size: 2.5rem;
                font-weight: 700;
                color: var(--secondary-color);
                margin-bottom: 10px;
            }
            .left-section p {
                font-size: 1.2rem;
                margin-bottom: 15px;
            }
            .book-now-btn {
                background: var(--primary-color);
                color: var(--secondary-color);
                padding: 12px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                transition: 0.3s;
            }
            .book-now-btn:hover {
                background: #e0b800;
            }
            .booking-form-container {
                flex: 1;
                background: white;
                padding: 0;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }
            .booking-header {
                background: var(--primary-color);
                color: var(--secondary-color);
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
                background: var(--primary-color);
                color: var(--secondary-color);
                padding: 14px;
                border: none;
                width: 100%;
                border-radius: 0;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                margin-top: 15px;
                transition: 0.3s;
            }
            .book-btn:hover {
                background: #e0b800;
            }
        </style>
    </head>
    <body>
        <div class="booking-container">
            <div class="left-section">
                <h1>Best In City</h1>
                <h1 class="main-heading">TRUSTED CAB SERVICE IN COLOMBO</h1>
                <p>"Experience the convenience of booking a cab in just a few clicks. Whether you're heading to the airport or need a ride across the city, we offer fast, reliable service with friendly drivers ready to take you wherever you need to go."</p>
                <button class="book-now-btn" onclick="document.querySelector('.booking-form-container').scrollIntoView({behavior: 'smooth'});">Book Now</button>
            </div>
            <div class="booking-form-container">
                <div class="booking-header">BOOK A CAB</div>

                <form action="BookingServlet" method="post" class="form-container">
                    <input type="hidden" name="action" value="book"> 
                    <div class="input-row">
                        <input class="inputField" type="text" name="name" placeholder="Name" required>
                        <input class="inputField" type="text" name="phone" placeholder="Phone" required>
                    </div>
                    <div class="input-row">
                        <input class="inputField" type="text" name="start" placeholder="Start Location" required>
                        <input class="inputField" type="text" name="end" placeholder="End Location" required>
                    </div>
                    <input class="inputField" type="text" name="cab" placeholder="Enter Cab Type" required>
                    <button type="submit" class="book-btn">BOOK NOW</button>
                </form>

            </div>
        </div>
    </body>
</html>