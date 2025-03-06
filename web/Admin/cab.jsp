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
                margin: 0;
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
                padding: 30px;
                width: 100%;
            }
            .table th {
                background-color: var(--primary-color);
                color: black;
            }
            .table td {
                text-align: center;
            }
            .table tbody tr:nth-child(even) {
                background-color: #f1f1f1;
            }
            .table tbody tr:hover {
                background-color: #e2e2e2;
            }
            .btn-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }
            .btn-primary:hover {
                background-color: #fcd34d;
                border-color: #fcd34d;
            }
            .modal-content {
                padding: 20px;
            }
            .modal-header {
                border-bottom: 2px solid var(--primary-color);
            }
            .modal-footer {
                border-top: 2px solid var(--primary-color);
            }
            .modal-body label {
                font-weight: bold;
            }
        </style>
        <script>
            function populateEditForm(id, type, model, regNum, seating, status) {
                document.getElementById("editId").value = id;
                document.getElementById("editType").value = type;
                document.getElementById("editModel").value = model;
                document.getElementById("editRegNum").value = regNum;
                document.getElementById("editSeating").value = seating;
                document.getElementById("editStatus").value = status;
            }
        </script>
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
            <h2 class="mb-4">Cabs</h2>
            <button class="btn btn-primary mb-4" data-bs-toggle="modal" data-bs-target="#addCabModal">
                <i class="fas fa-plus"></i> Add Cab
            </button>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Type</th>
                        <th>Model</th>
                        <th>Registration</th>
                        <th>Seating</th>
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
                            <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editCabModal"
                                    onclick="populateEditForm('<%= rs.getInt("id")%>', '<%= rs.getString("type")%>',
                                                    '<%= rs.getString("model")%>', '<%= rs.getString("registration_number")%>',
                                                    '<%= rs.getInt("seating_capacity")%>', '<%= rs.getString("status")%>')">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <a href="<%= request.getContextPath()%>/CabServlet?action=delete&id=<%= rs.getInt("id")%>" class="btn btn-danger"
                               onclick="return confirm('Are you sure you want to delete this cab?');">
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
        <div class="modal fade" id="addCabModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../CabServlet" method="post">
                        <input type="hidden" name="action" value="save">
                        <div class="modal-header">
                            <h5 class="modal-title">Add New Cab</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <label>Type</label>
                            <input type="text" class="form-control" name="type" required>
                            <label>Model</label>
                            <input type="text" class="form-control" name="model" required>
                            <label>Registration Number</label>
                            <input type="text" class="form-control" name="registrationNumber" required>
                            <label>Seating Capacity</label>
                            <input type="number" class="form-control" name="seatingCapacity" required>
                            <label>Status</label>
                            <select class="form-control" name="status" required>
                                <option value="Available">Available</option>
                                <option value="Booked">Booked</option>
                                <option value="In Service">In Service</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Add Cab</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Edit Cab Modal -->
        <div class="modal fade" id="editCabModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="../CabServlet" method="post">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" id="editId" name="id">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Cab</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <label>Type</label>
                            <input type="text" id="editType" class="form-control" name="type" required>
                            <label>Model</label>
                            <input type="text" id="editModel" class="form-control" name="model" required>
                            <label>Registration Number</label>
                            <input type="text" id="editRegNum" class="form-control" name="registrationNumber" required>
                            <label>Seating Capacity</label>
                            <input type="number" id="editSeating" class="form-control" name="seatingCapacity" required>
                            <label>Status</label>
                            <select id="editStatus" class="form-control" name="status" required>
                                <option value="Available">Available</option>
                                <option value="Booked">Booked</option>
                                <option value="In Service">In Service</option>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-warning">Update Cab</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
