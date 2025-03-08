//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.*;
//
//@WebServlet("/BookingServlet")
//public class BookingServlet extends HttpServlet {
//
//    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
//    private static final String JDBC_USER = "root";
//    private static final String JDBC_PASSWORD = "";
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if ("book".equals(action)) {
//            bookCab(request, response);
//        } else {
//            response.sendRedirect("error.jsp?error=invalid_action");
//        }
//    }
//
//    private void bookCab(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String name = request.getParameter("name");
//        String phone = request.getParameter("phone");
//        String startLocation = request.getParameter("start");
//        String endLocation = request.getParameter("end");
//        String cabType = request.getParameter("cab");
//
//        Connection conn = null;
//        PreparedStatement stmt = null;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");  
//            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
//            String query = "INSERT INTO bookings (customer_name, phone, pickup_location, dropoff_location, cab_type, booking_status) VALUES (?, ?, ?, ?, ?, 'Confirmed')";
//            stmt = conn.prepareStatement(query);
//            stmt.setString(1, name);
//            stmt.setString(2, phone);
//            stmt.setString(3, startLocation);
//            stmt.setString(4, endLocation);
//            stmt.setString(5, cabType);
//
//            int rowsInserted = stmt.executeUpdate();
//
//            if (rowsInserted > 0) {
//                response.sendRedirect("confirmation.jsp");
//            } else {
//                response.sendRedirect("bookingFailed.jsp?error=db_error");
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();  // This will print the error to the server log (check your server logs)
//            response.sendRedirect("bookingFailed.jsp?error=db_error");
//        }
//
//    }
//
//    private void closeConnection(Connection conn, PreparedStatement stmt, ResultSet rs) {
//        try {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stmt != null) {
//                stmt.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//}

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Booking> bookings = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String query = "SELECT * FROM bookings";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("id"),
                        rs.getString("customer_name"),
                        rs.getString("phone"),
                        rs.getString("pickup_location"),
                        rs.getString("dropoff_location"),
                        rs.getString("cab_type"),
                        rs.getString("booking_status")
                );
                bookings.add(booking);
            }

            request.setAttribute("bookings", bookings);
            request.getRequestDispatcher("Admin/booking.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=db_error");
        } finally {
            closeConnection(conn, stmt, rs);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("book".equals(action)) {
            bookCab(request, response);
        } else {
            response.sendRedirect("error.jsp?error=invalid_action");
        }
    }

    private void bookCab(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String startLocation = request.getParameter("start");
        String endLocation = request.getParameter("end");
        String cabType = request.getParameter("cab");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String bookingId = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String query = "INSERT INTO bookings (customer_name, phone, pickup_location, dropoff_location, cab_type, booking_status) VALUES (?, ?, ?, ?, ?, 'Confirmed')";
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, startLocation);
            stmt.setString(4, endLocation);
            stmt.setString(5, cabType);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    bookingId = rs.getString(1);
                }

                response.sendRedirect("BillingServlet?bookingId=" + bookingId);
            } else {
                response.sendRedirect("bookingFailed.jsp?error=db_error");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("bookingFailed.jsp?error=db_error");
        } finally {
            closeConnection(conn, stmt, rs);
        }
    }

    private void closeConnection(Connection conn, PreparedStatement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Booking model class for storing booking data
    public static class Booking {
        private int id;
        private String customerName;
        private String phone;
        private String pickupLocation;
        private String dropoffLocation;
        private String cabType;
        private String status;

        public Booking(int id, String customerName, String phone, String pickupLocation, String dropoffLocation, String cabType, String status) {
            this.id = id;
            this.customerName = customerName;
            this.phone = phone;
            this.pickupLocation = pickupLocation;
            this.dropoffLocation = dropoffLocation;
            this.cabType = cabType;
            this.status = status;
        }

        public int getId() { return id; }
        public String getCustomerName() { return customerName; }
        public String getPhone() { return phone; }
        public String getPickupLocation() { return pickupLocation; }
        public String getDropoffLocation() { return dropoffLocation; }
        public String getCabType() { return cabType; }
        public String getStatus() { return status; }
    }
}

//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.*;
//
//@WebServlet("/BookingServlet")
//public class BookingServlet extends HttpServlet {
//
//    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
//    private static final String JDBC_USER = "root";
//    private static final String JDBC_PASSWORD = "";
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if ("book".equals(action)) {
//            bookCab(request, response);
//        } else {
//            response.sendRedirect("error.jsp?error=invalid_action");
//        }
//    }
//
//    private void bookCab(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String name = request.getParameter("name");
//        String phone = request.getParameter("phone");
//        String startLocation = request.getParameter("start");
//        String endLocation = request.getParameter("end");
//        String cabType = request.getParameter("cab");
//
//        Connection conn = null;
//        PreparedStatement stmt = null;
//        ResultSet rs = null;
//        String bookingId = null;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
//
//            // Insert booking into the database
//            String query = "INSERT INTO bookings (customer_name, phone, pickup_location, dropoff_location, cab_type, booking_status) VALUES (?, ?, ?, ?, ?, 'Confirmed')";
//            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
//            stmt.setString(1, name);
//            stmt.setString(2, phone);
//            stmt.setString(3, startLocation);
//            stmt.setString(4, endLocation);
//            stmt.setString(5, cabType);
//
//            int rowsInserted = stmt.executeUpdate();
//            if (rowsInserted > 0) {
//                rs = stmt.getGeneratedKeys();
//                if (rs.next()) {
//                    bookingId = rs.getString(1);
//                }
//
//                // Redirect to BillingServlet with the bookingId
//                response.sendRedirect("BillingServlet?bookingId=" + bookingId);
//            } else {
//                response.sendRedirect("bookingFailed.jsp?error=db_error");
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();
//            response.sendRedirect("bookingFailed.jsp?error=db_error");
//        } finally {
//            closeConnection(conn, stmt, rs);
//        }
//    }
//
//    private void closeConnection(Connection conn, PreparedStatement stmt, ResultSet rs) {
//        try {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stmt != null) {
//                stmt.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//}
