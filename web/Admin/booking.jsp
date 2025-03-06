<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bookings - Admin Dashboard</title>
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
            /*        .sidebar {
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
                    }*/

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

            #map {
                height: 400px;
                width: 100%;
                margin-top: 20px;
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
            <h2>Bookings</h2>
            <div class="mb-3">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBookingModal">
                    <i class="fas fa-plus"></i> Add Booking
                </button>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Customer Name</th>
                        <th>Pickup Location</th>
                        <th>Destination</th>
                        <th>Booking Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Replace with dynamic rows -->
                    <tr>
                        <td>1</td>
                        <td>John Doe</td>
                        <td>Colombo</td>
                        <td>Mount Lavinia</td>
                        <td>2025-02-15</td>
                        <td>Completed</td>
                        <td>
                            <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</button>
                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jane Smith</td>
                        <td>Colombo</td>
                        <td>Negombo</td>
                        <td>2025-02-16</td>
                        <td>Pending</td>
                        <td>
                            <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</button>
                            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Add Booking Modal -->
        <div class="modal fade" id="addBookingModal" tabindex="-1" aria-labelledby="addBookingModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addBookingModalLabel">Add New Booking</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="BookingServlet" method="post">
                            <!--<form action=>"BookingServlet" method="post">-->

                            <div class="mb-3">
                                <label for="customerName" class="form-label">Customer Name</label>
                                <input type="text" class="form-control" id="customerName" name="customerName" required>
                            </div>
                            <div class="mb-3">
                                <label for="pickupLocation" class="form-label">Pickup Location</label>
                                <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" required>
                            </div>
                            <div class="mb-3">
                                <label for="destination" class="form-label">Destination</label>
                                <input type="text" class="form-control" id="destination" name="destination" required>
                            </div>
                            <div class="mb-3">
                                <label for="bookingDate" class="form-label">Booking Date</label>
                                <input type="date" class="form-control" id="bookingDate" name="bookingDate" required>
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status">
                                    <option value="Pending">Pending</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Cancelled">Cancelled</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="pickupCoordinates" class="form-label">Pickup Coordinates (Latitude, Longitude)</label>
                                <input type="text" class="form-control" id="pickupCoordinates" name="pickupCoordinates" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="destinationCoordinates" class="form-label">Destination Coordinates (Latitude, Longitude)</label>
                                <input type="text" class="form-control" id="destinationCoordinates" name="destinationCoordinates" readonly>
                            </div>
                            <div id="map"></div>
                            <button type="submit" class="btn btn-primary">Add Booking</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Google Maps API -->
        <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&callback=initMap&libraries=places" async defer></script>
        <script>
            var map;
            var pickupMarker, destinationMarker;
            var pickupCoordinatesInput = document.getElementById('pickupCoordinates');
            var destinationCoordinatesInput = document.getElementById('destinationCoordinates');

            function initMap() {
                map = new google.maps.Map(document.getElementById("map"), {
                    center: {lat: 6.9271, lng: 79.8612}, // Default to Colombo coordinates
                    zoom: 12
                });

                // Add event listener to place markers
                google.maps.event.addListener(map, "click", function (event) {
                    placeMarker(event.latLng);
                });

                function placeMarker(location) {
                    if (!pickupMarker) {
                        pickupMarker = new google.maps.Marker({
                            position: location,
                            map: map,
                            title: "Pickup Location"
                        });
                        pickupCoordinatesInput.value = location.lat() + ", " + location.lng();
                    } else if (!destinationMarker) {
                        destinationMarker = new google.maps.Marker({
                            position: location,
                            map: map,
                            title: "Destination Location"
                        });
                        destinationCoordinatesInput.value = location.lat() + ", " + location.lng();
                    }
                }
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>