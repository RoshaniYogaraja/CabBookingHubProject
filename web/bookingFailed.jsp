<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Booking Failed</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                color: #333;
                text-align: center;
                padding: 50px;
            }
            .message {
                font-size: 1.5rem;
                color: #d9534f;
            }
            .retry-button {
                background-color: #ffc727;
                color: #000;
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .retry-button:hover {
                background-color: #e0b800;
            }
        </style>
    </head>
    <body>
        <h1>Booking Failed</h1>
        <p class="message">
            <strong>Something went wrong with your booking.</strong>
        </p>
        <p>Please try again later or contact support for assistance.</p>
        <button class="retry-button" onclick="window.history.back();">Go Back</button>
    </body>
</html>
