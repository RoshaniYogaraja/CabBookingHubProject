<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        <title>Booking Failed</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
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
            .failed {
                font-size: 24px;
                font-weight: bold;
                color: #d9534f;
                margin-bottom: 15px;
            }
            .message {
                font-size: 18px;
                color: #555;
                margin-bottom: 20px;
            }
            .retry-button {
                display: inline-block;
                margin-top: 20px;
                padding: 12px 25px;
                background-color: #d9534f;
                color: #fff;
                text-decoration: none;
                font-size: 16px;
                border-radius: 5px;
                transition: 0.3s;
            }
            .retry-button:hover {
                background-color: #c9302c;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="failed">❌ Booking Failed ❌</div>
            <p class="message">Oops! Something went wrong with your booking. 😞<br>Please try again or contact support for assistance.</p>

            <a href="booking.jsp" class="retry-button">Try Again</a>
        </div>
    </body>
</html>