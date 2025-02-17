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
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #f4b400, #ff8f00);
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            box-sizing: border-box;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 50px;
            flex-wrap: wrap;
            width: 80%;
            max-width: 1200px;
        }

        .left-section {
            flex: 1;
            max-width: 45%;
            padding: 20px;
            text-align: center;
        }

        .left-section h1 {
            font-size: 2.8rem;
            font-weight: 700;
            color: white;
        }

        .left-section p {
            font-size: 18px;
            color: white;
            margin-top: 15px;
            line-height: 1.5;
        }

        .book-now-btn {
            background: #000;
            color: white;
            padding: 14px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 16px;
            transition: background 0.3s;
        }

        .book-now-btn:hover {
            background: #333;
        }

        .right-section {
            flex: 1;
            max-width: 50%;
            padding: 25px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1);
        }

        .right-section h2 {
            font-size: 2rem;
            text-align: center;
            margin-bottom: 15px;
            color: #333;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        .input-group label {
            font-size: 14px;
            margin-bottom: 5px;
            color: #555;
        }

        .input-group input, .input-group select, .input-group button {
            padding: 12px;
            font-size: 14px;
            margin-top: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .input-group input, .input-group select {
            background-color: #f9f9f9;
            color: #333;
        }

        .book-btn {
            background-color: #f4b400;
            color: white;
            border: none;
            cursor: pointer;
            padding: 15px 0;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .book-btn:hover {
            background-color: #ff8f00;
        }

        .input-group select, .input-group button {
            width: 100%;
        }

        /* Responsive Design */
        @media (max-width: 900px) {
            .container {
                flex-direction: column;
                text-align: center;
                gap: 30px;
            }

            .left-section, .right-section {
                max-width: 90%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Left Section -->
    <div class="left-section">
        <h1>TRUSTED CAB SERVICE</h1>
        <p>Book a ride with ease! Our reliable cab service ensures you're never far from your destination.</p>
        <button class="book-now-btn">Book Now</button>
    </div>

    <!-- Right Section - Booking Form -->
    <div class="right-section">
        <h2>Book Your Ride</h2>
        <form action="BookingServlet" method="post">
            <div class="input-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" placeholder="Enter your full name" required>
            </div>
            <div class="input-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required>
            </div>
            <div class="input-group">
                <label for="start">Pickup Location</label>
                <input type="text" id="start" name="start" placeholder="Enter pickup location" required>
            </div>
            <div class="input-group">
                <label for="end">Drop-off Location</label>
                <input type="text" id="end" name="end" placeholder="Enter drop-off location" required>
            </div>
            <div class="input-group">
                <label for="pickup_time">Pickup Time</label>
                <input type="datetime-local" id="pickup_time" name="pickup_time" required>
            </div>
            <div class="input-group">
                <label for="vehicle">Choose a Vehicle</label>
                <select name="vehicle" id="vehicle" required>
                    <option value="Sedan">Sedan</option>
                    <option value="SUV">SUV</option>
                    <option value="Minivan">Minivan</option>
                    <option value="Luxury">Luxury</option>
                </select>
            </div>
            <button type="submit" class="book-btn">BOOK NOW</button>
        </form>
    </div>
</div>

</body>
</html>
