<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cabs - Admin Dashboard</title>
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
        <h2>Cabs</h2>
        <div class="mb-3">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCabModal">
                <i class="fas fa-plus"></i> Add Cab
            </button>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Cab Model</th>
                    <th>License Plate</th>
                    <th>Status</th>
                    <th>Assigned Driver</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Replace with dynamic rows -->
                <tr>
                    <td>1</td>
                    <td>Toyota Prius</td>
                    <td>WP-ABC-1234</td>
                    <td>Available</td>
                    <td>Raj Perera</td>
                    <td>
                        <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</button>
                        <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Nissan Leaf</td>
                    <td>WP-XYZ-5678</td>
                    <td>In Use</td>
                    <td>Kamal Silva</td>
                    <td>
                        <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</button>
                        <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Add Cab Modal -->
    <div class="modal fade" id="addCabModal" tabindex="-1" aria-labelledby="addCabModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCabModalLabel">Add New Cab</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="addCabServlet" method="post">
                        <div class="mb-3">
                            <label for="cabModel" class="form-label">Cab Model</label>
                            <input type="text" class="form-control" id="cabModel" name="cabModel" required>
                        </div>
                        <div class="mb-3">
                            <label for="licensePlate" class="form-label">License Plate</label>
                            <input type="text" class="form-control" id="licensePlate" name="licensePlate" required>
                        </div>
                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" id="status" name="status">
                                <option value="Available">Available</option>
                                <option value="In Use">In Use</option>
                                <option value="Under Maintenance">Under Maintenance</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="assignedDriver" class="form-label">Assigned Driver</label>
                            <input type="text" class="form-control" id="assignedDriver" name="assignedDriver" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Cab</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>