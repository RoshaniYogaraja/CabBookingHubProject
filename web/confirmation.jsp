<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            color: #4CAF50;
        }
        p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }
        .booking-details {
            margin-bottom: 20px;
        }
        .booking-details p {
            font-size: 1.1em;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Booking Confirmed!</h2>
        <p>Your cab has been booked successfully. Here are your booking details:</p>
        
        <div class="booking-details">
            <p><strong>Booking ID:</strong> 12345</p>
            <p><strong>Cab Type:</strong> Sedan</p>
            <p><strong>Pickup Location:</strong> Colombo City Center</p>
            <p><strong>Drop-off Location:</strong> Colombo Fort</p>
            <p><strong>Booking Date & Time:</strong> February 27, 2025, 10:00 AM</p>
            <p><strong>Driver Name:</strong> John Doe</p>
        </div>
        
        <a href="booking.jsp">Book Another Cab</a>
    </div>

</body>
</html>
