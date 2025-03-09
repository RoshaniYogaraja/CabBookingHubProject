<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Feedback</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            text-align: center;
            padding: 20px;
        }
        .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .feedback-wrapper {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }
        .feedback-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: left;
            flex: 1;
        }
        .user-info {
            display: flex;
            align-items: center;
            margin-top: 15px;
        }
        .user-image {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #555;
            margin-right: 10px;
        }
        .arrows {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .arrow {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title">Our Customer Feedbacks</div>
        <div class="feedback-wrapper">
            <div class="feedback-card">
                <p>"The ride was smooth and enjoyable. The driver was friendly and made sure I was comfortable throughout. Highly recommended!"</p>
                <div class="user-info">
                    <div class="user-image">A</div>
                    <div class="user-name">Alex Johnson</div>
                </div>
            </div>
            <div class="feedback-card">
                <p>"Excellent service! The vehicle was clean, and the driver was professional. Will definitely book again for my next trip."</p>
                <div class="user-info">
                    <div class="user-image">B</div>
                    <div class="user-name">Brian Smith</div>
                </div>
            </div>
            <div class="feedback-card">
                <p>"Affordable, punctual, and reliable! The entire trip was hassle-free, and I felt safe throughout the journey. 5 stars! Best Service...."</p>
                <div class="user-info">
                    <div class="user-image">C</div>
                    <div class="user-name">Christine Lee</div>
                </div>
            </div>
        </div>
        <div class="arrows">
            <button class="arrow"><i class="fas fa-chevron-left"></i></button>
            <button class="arrow"><i class="fas fa-chevron-right"></i></button>
        </div>
    </div>
</body>
</html>
