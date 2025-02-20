<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drivers - Admin Dashboard</title>
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

        /* Table */
        .table th {
            background-color: var(--primary-color);
            color: black;
        }
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        .btn-primary:hover {
            background-color: #fcd34d;
            border-color: #fcd34d;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Cab Booking Hub Admin Panel</h3>
        <a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="user.jsp"><i class="fas fa-users"></i> Users</a>
        <a href="driver.jsp"><i class="fas fa-user-tie"></i> Drivers</a>
        <a href="cab.jsp"><i class="fas fa-taxi"></i> Cabs</a>
        <a href="booking.jsp"><i class="fas fa-book"></i> Bookings</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Drivers</h2>
        <div class="mb-3">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDriverModal">
                <i class="fas fa-plus"></i> Add Driver
            </button>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Driver Name</th>
                    <th>License Number</th>
                    <th>Phone</th>
                    <th>Vehicle Assigned</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Replace with dynamic rows -->
                <tr>
                    <td>1</td>
                    <td>Raj Perera</td>
                    <td>B1234567</td>
                    <td>071-1234567</td>
                    <td>Cab #1234</td>
                    <td>
                        <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</button>
                        <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Kamal Silva</td>
                    <td>B7654321</td>
                    <td>077-7654321</td>
                    <td>Cab #5678</td>
                    <td>
                        <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</button>
                        <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Add Driver Modal -->
    <div class="modal fade" id="addDriverModal" tabindex="-1" aria-labelledby="addDriverModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDriverModalLabel">Add New Driver</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="addDriverServlet" method="post">
                        <div class="mb-3">
                            <label for="driverName" class="form-label">Driver Name</label>
                            <input type="text" class="form-control" id="driverName" name="driverName" required>
                        </div>
                        <div class="mb-3">
                            <label for="licenseNumber" class="form-label">License Number</label>
                            <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="vehicleAssigned" class="form-label">Vehicle Assigned</label>
                            <input type="text" class="form-control" id="vehicleAssigned" name="vehicleAssigned" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Driver</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>