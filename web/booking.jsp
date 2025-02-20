<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cab Booking</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4b400;
            color: black;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 80%;
            max-width: 1200px;
            gap: 50px;
        }

        /* Left Section */
        .left-section {
            max-width: 50%;
        }

        h1 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .main-heading {
            font-size: 2.5rem;
            font-weight: bold;
            line-height: 1.2;
        }

        .description {
            font-size: 16px;
            margin-top: 15px;
            line-height: 1.5;
        }

        .book-now-btn {
            background: black;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
            transition: 0.3s;
        }

        .book-now-btn:hover {
            background: #333;
        }

        /* Right Section - Booking Form */
        .booking-container {
            background: white;
            padding: 0;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
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

        /* Responsive Design */
        @media (max-width: 900px) {
            .container {
                flex-direction: column;
                text-align: center;
                gap: 30px;
            }

            .left-section, .booking-container {
                max-width: 90%;
            }
        }
    </style>
</head>
<body>
     

<div class="container">
    
    <!-- Left Section -->
    <div class="left-section">
        <h1>Best In City</h1>
        <h1 class="main-heading">TRUSTED CAB SERVICE IN COLOMBO</h1>
        <p class="description">
            "Experience the convenience of booking a cab in just a few clicks.
            Whether you're heading to the airport or need a ride across the city,
            we offer fast, reliable service with friendly drivers ready to take you wherever you need to go."
        </p>
        <button class="book-now-btn">Book Now</button>
    </div>

    <!-- Right Section - Booking Form -->
    <div class="booking-container">
        <div class="booking-header">BOOK A CAB</div>
        <form action="BookingServlet" method="post" class="form-container">
            <div class="input-row">
                <input class="inputField" type="text" name="name" placeholder="Name" required>
                <input class="inputField" type="text" name="phone" placeholder="Phone" required>
            </div>
            <div class="input-row">
                <input class="inputField" type="text" name="start" placeholder="Start" required>
                <input class="inputField" type="text" name="end" placeholder="End" required>
            </div>
            <input class="inputField" type="text" name="vehicle" placeholder="Choose a Vehicle" required>
            <button type="submit" class="book-btn">BOOK NOW</button>
        </form>
    </div>
</div>

</body>
</html>
