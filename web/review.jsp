<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script>
        let currentIndex = 0;
        function changeReview(direction) {
            const reviews = document.querySelectorAll(".review");
            const total = reviews.length;
            const itemsPerRow = 3;
            reviews.forEach(r => r.classList.remove("active"));
            currentIndex = (direction === 'next') ? (currentIndex + itemsPerRow) % total : (currentIndex - itemsPerRow + total) % total;
            for (let i = 0; i < itemsPerRow; i++) {
                reviews[(currentIndex + i) % total].classList.add("active");
            }
        }
        
        setInterval(() => changeReview('next'), 5000); // Auto-scroll every 5s
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }
        .review-container {
            width: 80%;
            margin: auto;
            text-align: center;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .review-wrapper {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .review {
            width: 30%;
            display: none;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 10px;
            text-align: left;
            min-height: 120px;
        }
        .review.active {
            display: block;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
        }
        .user-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #555;
        }
        .user-name {
            font-weight: bold;
        }
        .arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
        }
        .arrow-left {
            left: -40px;
        }
        .arrow-right {
            right: -40px;
        }
    </style>
</head>
<body>
    <div class="review-container">
        <h2>Google Reviews</h2>
        
        <div class="review-wrapper">
            <div class="review active">
                <p>"The ride was smooth and enjoyable. The driver was friendly and made sure I was comfortable throughout. Highly recommended!"</p>
                <div class="user-info">
                    <div class="user-image">A</div>
                    <div class="user-name">Alex Johnson</div>
                </div>
            </div>
            <div class="review active">
                <p>"Excellent service! The vehicle was clean, and the driver was professional. Will definitely book again for my next trip."</p>
                <div class="user-info">
                    <div class="user-image">B</div>
                    <div class="user-name">Brian Smith</div>
                </div>
            </div>
            <div class="review active">
                <p>"Affordable, punctual, and reliable! The entire trip was hassle-free, and I felt safe throughout the journey. 5 stars! Best Service...."</p>
                <div class="user-info">
                    <div class="user-image">C</div>
                    <div class="user-name">Christine Lee</div>
                </div>
            </div>
            <div class="review">
                <p>"Great experience from start to finish! Booking was simple, and the ride was comfortable. Will recommend to my friends."</p>
                <div class="user-info">
                    <div class="user-image">D</div>
                    <div class="user-name">David Miller</div>
                </div>
            </div>
        </div>

        <button class="arrow arrow-left" onclick="changeReview('prev')">&#9664;</button>
        <button class="arrow arrow-right" onclick="changeReview('next')">&#9654;</button>
    </div>
</body>
</html>
