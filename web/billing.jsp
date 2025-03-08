<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing - Cab Booking Hub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
        }
        .billing-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .billing-header {
            background: #ffc727;
            color: #000;
            text-align: center;
            padding: 15px;
            font-size: 20px;
            font-weight: bold;
        }
        .billing-details {
            margin-top: 20px;
        }
        .billing-details table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .billing-details th, .billing-details td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }
        .total-fare {
            font-size: 1.2rem;
            font-weight: bold;
            color: #000;
            margin-top: 20px;
        }
        .back-btn {
            display: block;
            width: 200px;
            background: #ffc727;
            color: #000;
            padding: 12px;
            text-align: center;
            margin: 30px auto;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="billing-container">
        <div class="billing-header">
            Billing Details
        </div>

        <div class="billing-details">
            <table>
                <tr>
                    <th>Name</th>
                    <td>${requestScope.customerName}</td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>${requestScope.phone}</td>
                </tr>
                <tr>
                    <th>Pickup Location</th>
                    <td>${requestScope.startLocation}</td>
                </tr>
                <tr>
                    <th>Dropoff Location</th>
                    <td>${requestScope.endLocation}</td>
                </tr>
                <tr>
                    <th>Cab Type</th>
                    <td>${requestScope.cabType}</td>
                </tr>
                <tr>
                    <th>Booking Status</th>
                    <td>${requestScope.bookingStatus}</td>
                </tr>
            </table>

            <div class="total-fare">
                Total Fare: Rs. ${requestScope.fare}
            </div>
        </div>

        <a href="index.jsp" class="back-btn">Back to Home</a>
    </div>
</body>
</html>
