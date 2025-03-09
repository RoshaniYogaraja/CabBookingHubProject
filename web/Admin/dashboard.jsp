<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            :root {
                --primary-color: #ffc727;
                --dark-bg: #ffc727;
                --light-text: black;
            }

            body {
                display: flex;
                background-color: #f8f9fa;
            }
            .sidebar {
                width: 250px;
                height: 100vh;
                background: #b8860b;
                color: white;
                padding-top: 20px;
                position: fixed;
            }

            .sidebar h3 {
                text-align: center;
                font-size: 1.5rem;
                font-weight: bold;
                color: white;
                margin-bottom: 20px;
            }

            .sidebar a {
                padding: 12px 20px;
                display: block;
                color: white;
                text-decoration: none;
                font-size: 1.1rem;
                transition: 0.3s;
                border-radius: 20px;
            }

            .sidebar a:hover {
                background: #ffc727;
                color: black;
                font-weight: bold;
            }

            .main-content {
                margin-left: 250px;
                padding: 20px;
                width: 100%;
            }

            .card {
                border-radius: 10px;
                box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
                transition: 0.3s;
            }
            .card:hover {
                transform: scale(1.05);
            }
            .card-icon {
                font-size: 2rem;
                color: var(--primary-color);
            }
            .card-title {
                font-weight: bold;
            }
            .car-image {
                display: block;
                margin: 10px auto;
                width: 30%;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h3>Cab Booking Hub Admin Panel</h3>
            <a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="user.jsp"><i class="fas fa-users"></i> Users</a>
            <a href="driver.jsp"><i class="fas fa-car"></i> Drivers</a>
            <a href="cab.jsp"><i class="fas fa-taxi"></i> Cabs</a>
            <a href="booking.jsp"><i class="fas fa-book"></i> Bookings</a>
            <a href="billing.jsp"><i class="fas fa-book"></i> Billing</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <div class="main-content">
            <h2>Dashboard</h2>
            <div class="row">
                <div class="col-md-3">
                    <div class="card bg-light p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Total Users</h5>
                                <h3>5</h3>
                            </div>
                            <i class="fas fa-users card-icon"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-light p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Total Drivers</h5>
                                <h3>15</h3>
                            </div>
                            <i class="fas fa-user-tie card-icon"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-light p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Total Cabs</h5>
                                <h3>10</h3>
                            </div>
                            <i class="fas fa-car card-icon"></i>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-light p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="card-title">Total Bookings</h5>
                                <h3>10</h3>
                            </div>
                            <i class="fas fa-book card-icon"></i>
                        </div>
                    </div>
                </div>
            </div>
            <img src="../assets/yellow-cab.png" alt="Car Image" class="car-image">
        </div>
    </body>
</html>
