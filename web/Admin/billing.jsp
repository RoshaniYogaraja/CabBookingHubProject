<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Billing - Admin Dashboard</title>
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
            <h2>Billing Details</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Customer Name</th>
                        <th>Phone Number</th>
                        <th>Pickup Location</th>
                        <th>Dropoff Location</th>
                        <th>Cab Type</th>
                        <th>Fare</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure MySQL Driver is loaded
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/cab_booking", "root", "");
                            Statement stmt = conn.createStatement();

                            // Join bookings with billing to get the fare details
                            String sql = "SELECT b.booking_id, b.customer_name, b.phone, b.pickup_location, "
                                    + "b.dropoff_location, b.cab_type, b.booking_status, bill.fare "
                                    + "FROM bookings b "
                                    + "LEFT JOIN billing bill ON b.booking_id = bill.booking_id";

                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("booking_id")%></td>
                        <td><%= rs.getString("customer_name")%></td>
                        <td><%= rs.getString("phone")%></td>
                        <td><%= rs.getString("pickup_location")%></td>
                        <td><%= rs.getString("dropoff_location")%></td>
                        <td><%= rs.getString("cab_type")%></td>
                        <td><%= String.format("%.2f", rs.getDouble("fare"))%></td>
                    </tr>
                    <%
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }
                    %>
                </tbody>

            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
