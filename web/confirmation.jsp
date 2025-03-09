<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        <title>Booking Confirmation</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                color: #333;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                max-width: 600px;
                padding: 30px;
                background: #fff;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                text-align: center;
            }
            .thank-you {
                font-size: 24px;
                font-weight: bold;
                color: #ffc727;
                margin-bottom: 15px;
            }
            .message {
                font-size: 18px;
                color: #555;
                margin-bottom: 20px;
            }
            .button {
                display: inline-block;
                margin-top: 20px;
                padding: 12px 25px;
                background-color: #ffc727;
                color: #000;
                text-decoration: none;
                font-size: 16px;
                border-radius: 5px;
                transition: 0.3s;
            }
            .button:hover {
                background-color: #e0b800;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="thank-you">🎉 Thank You for Your Booking! 🎉</div>
            <p class="message">We wish you a happy and safe journey! 🚖✨<br>If you’re ready, let’s book your next ride now! 🚗</p>

            <a href="booking.jsp" class="button">Book Your Next Ride</a>
        </div>
    </body>
</html>