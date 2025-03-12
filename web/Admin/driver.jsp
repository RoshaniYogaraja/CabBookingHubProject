<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
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
            .sidebar {
                width: 250px;
                height: 100vh;
                background: #b8860b; /* Dark yellow */
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
                border-radius: 20px; /* Rounded edges */
            }

            .sidebar a:hover {
                background: #ffc727; /* Light yellow */
                color: black;
                font-weight: bold;
                border-radius: 20px; /* Ensure rounded corners */
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
            <a href="billing.jsp"><i class="fas fa-book"></i> Billing</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

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
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/cab_booking", "root", "");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM drivers");
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id")%></td>
                        <td><%= rs.getString("name")%></td>
                        <td><%= rs.getString("license_number")%></td>
                        <td><%= rs.getString("phone")%></td>
                        <td><%= rs.getString("vehicle_assigned")%></td>
                        <td>
                            <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#editDriverModal"
                                    onclick="populateEditForm('<%= rs.getInt("id")%>', '<%= rs.getString("name")%>',
                                                    '<%= rs.getString("license_number")%>', '<%= rs.getString("phone")%>',
                                                    '<%= rs.getString("vehicle_assigned")%>')">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <a href="../DriverServlet?action=delete&driverId=<%= rs.getInt("id")%>"
                               onclick="return confirm('Are you sure you want to delete this driver?');"
                               class="btn btn-sm btn-danger">
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

        <!-- Add Driver Modal -->
        <div class="modal fade" id="addDriverModal" tabindex="-1" aria-labelledby="addDriverModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDriverModalLabel">Add New Driver</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../DriverServlet" method="post">
                            <input type="hidden" name="action" value="save">
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

        <!-- Edit Driver Modal -->
        <div class="modal fade" id="editDriverModal" tabindex="-1" aria-labelledby="editDriverModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../DriverServlet" method="post">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" id="editId" name="driverId">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editDriverModalLabel">Edit Driver</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="editName" class="form-label">Driver Name</label>
                                <input type="text" class="form-control" id="editName" name="driverName" required>
                            </div>
                            <div class="mb-3">
                                <label for="editLicense" class="form-label">License Number</label>
                                <input type="text" class="form-control" id="editLicense" name="licenseNumber" required>
                            </div>
                            <div class="mb-3">
                                <label for="editPhone" class="form-label">Phone</label>
                                <input type="text" class="form-control" id="editPhone" name="phone" required>
                            </div>
                            <div class="mb-3">
                                <label for="editVehicle" class="form-label">Vehicle Assigned</label>
                                <input type="text" class="form-control" id="editVehicle" name="vehicleAssigned" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-warning">Update Driver</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function populateEditForm(id, name, license, phone, vehicle) {
                document.getElementById("editId").value = id;
                document.getElementById("editName").value = name;
                document.getElementById("editLicense").value = license;
                document.getElementById("editPhone").value = phone;
                document.getElementById("editVehicle").value = vehicle;
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
