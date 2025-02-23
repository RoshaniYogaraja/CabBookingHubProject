<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
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
            .main-content {
                margin-left: 250px;
                padding: 20px;
                width: 100%;
            }
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
        <div class="sidebar">
            <h3>Cab Booking Hub Admin Panel</h3>
            <a href="dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="user.jsp"><i class="fas fa-users"></i> Users</a>
            <a href="driver.jsp"><i class="fas fa-user-tie"></i> Drivers</a>
            <a href="cab.jsp"><i class="fas fa-taxi"></i> Cabs</a>
            <a href="booking.jsp"><i class="fas fa-book"></i> Bookings</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

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
                        <th>Type</th>
                        <th>Model</th>
                        <th>Registration Number</th>
                        <th>Seating Capacity</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/cab_booking", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM cabs");
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id")%></td>
                        <td><%= rs.getString("type")%></td>
                        <td><%= rs.getString("model")%></td>
                        <td><%= rs.getString("registration_number")%></td>
                        <td><%= rs.getInt("seating_capacity")%></td>
                        <td><%= rs.getString("status")%></td>
                        <td>
                            <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</button>
                            <a href="../CabServlet?action=delete&id=<%= rs.getInt("id")%>" class="btn btn-sm btn-danger">
                                <i class="fas fa-trash"></i> Delete
                            </a>

                        </td>
                    </tr>
                    <%
                            }
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
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
                        <form action="../CabServlet" method="post">
                            <input type="hidden" name="action" value="save">
                            <div class="mb-3">
                                <label for="type" class="form-label">Type</label>
                                <input type="text" class="form-control" id="type" name="type" required>
                            </div>
                            <div class="mb-3">
                                <label for="model" class="form-label">Model</label>
                                <input type="text" class="form-control" id="model" name="model" required>
                            </div>
                            <div class="mb-3">
                                <label for="registrationNumber" class="form-label">Registration Number</label>
                                <input type="text" class="form-control" id="registrationNumber" name="registrationNumber" required>
                            </div>
                            <div class="mb-3">
                                <label for="seatingCapacity" class="form-label">Seating Capacity</label>
                                <input type="number" class="form-control" id="seatingCapacity" name="seatingCapacity" required>
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-control" id="status" name="status" required>
                                    <option value="Available">Available</option>
                                    <option value="Booked">Booked</option>
                                    <option value="In Service">In Service</option>
                                </select>
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
