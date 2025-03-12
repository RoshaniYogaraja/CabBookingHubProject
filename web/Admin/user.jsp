<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Users - Admin Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            :root {
                --primary-color: #ffc727;
                --dark-bg: #b8860b;
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
                background: var(--primary-color);
                color: black;
                font-weight: bold;
                border-radius: 20px;
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
            <a href="driver.jsp"><i class="fas fa-car"></i> Drivers</a>
            <a href="cab.jsp"><i class="fas fa-taxi"></i> Cabs</a>
            <a href="booking.jsp"><i class="fas fa-book"></i> Bookings</a>
            <a href="billing.jsp"><i class="fas fa-book"></i> Billing</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <div class="main-content">
            <h2>Users</h2>
            <div class="mb-3">

            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Phone Number</th>
                        <th>Role</th>
                        <th>Created At</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/cab_booking", "root", ""); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery("SELECT * FROM users")) {

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id")%></td>
                        <td><%= rs.getString("full_name")%></td>
                        <td><%= rs.getString("email")%></td>
                        <td><%= rs.getString("address")%></td>
                        <td><%= rs.getString("phoneNo")%></td>
                        <td><%= rs.getString("role")%></td>
                        <td><%= rs.getString("created_at")%></td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='6' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>