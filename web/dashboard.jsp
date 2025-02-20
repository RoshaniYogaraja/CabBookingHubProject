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

        /* Sidebar */
        .sidebar {
            width: 250px;
            height: 100vh;
            background: var(--dark-bg);
            color: var(--light-text);
            padding-top: 20px;
            position: fixed;
        }
        .sidebar h3 {
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
        }
        .sidebar a {
            padding: 12px 20px;
            display: block;
            color: var(--light-text);
            text-decoration: none;
            font-size: 1.1rem;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background: var(--primary-color);
            color: black;
            font-weight: bold;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
        }

        /* Dashboard Cards */
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
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Cab Booking Hub Admin Panel</h3>
         <!--<h4 class="mt-4" style="color: var(--primary-color); text-align: center ;">Cab Booking Hub</h4>-->
        <a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="user.jsp"><i class="fas fa-users"></i> Users</a>
        <a href="driver.jsp"><i class="fas fa-car"></i> Drivers</a>
        <a href="cab.jsp"><i class="fas fa-taxi"></i> Cabs</a>
        <a href="#"><i class="fas fa-book"></i> Bookings</a>
        <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Dashboard</h2>
        <div class="row">
            <!-- Total Users -->
            <div class="col-md-3">
                <div class="card bg-light p-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="card-title">Total Users</h5>
                            <h3>150</h3> <!-- Replace with dynamic count -->
                        </div>
                        <i class="fas fa-users card-icon"></i>
                    </div>
                </div>
            </div>
            
            <!-- Total Drivers -->
            <div class="col-md-3">
                <div class="card bg-light p-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="card-title">Total Drivers</h5>
                            <h3>45</h3> <!-- Replace with dynamic count -->
                        </div>
                        <i class="fas fa-user-tie card-icon"></i>
                    </div>
                </div>
            </div>
            
            <!-- Total Cabs -->
            <div class="col-md-3">
                <div class="card bg-light p-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="card-title">Total Cabs</h5>
                            <h3>60</h3> <!-- Replace with dynamic count -->
                        </div>
                        <i class="fas fa-car card-icon"></i>
                    </div>
                </div>
            </div>
            
            <!-- Total Bookings -->
            <div class="col-md-3">
                <div class="card bg-light p-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="card-title">Total Bookings</h5>
                            <h3>200</h3> <!-- Replace with dynamic count -->
                        </div>
                        <i class="fas fa-book card-icon"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>