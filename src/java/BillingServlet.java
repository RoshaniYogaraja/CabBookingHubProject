import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");

        if (bookingId != null && !bookingId.isEmpty()) {
            generateBill(request, response, bookingId);
        } else {
            response.sendRedirect("error.jsp?error=no_booking_id");
        }
    }

    private void generateBill(HttpServletRequest request, HttpServletResponse response, String bookingId)
            throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Fetch booking details
            String query = "SELECT customer_name, phone, pickup_location, dropoff_location, cab_type, booking_status FROM bookings WHERE booking_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, bookingId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                String customerName = rs.getString("customer_name");
                String phone = rs.getString("phone");
                String startLocation = rs.getString("pickup_location");
                String endLocation = rs.getString("dropoff_location");
                String cabType = rs.getString("cab_type");
                String bookingStatus = rs.getString("booking_status");

                // Calculate fare
                double fare = calculateFare(cabType);

                // Save bill to database
                saveBillToDatabase(bookingId, customerName, phone, startLocation, endLocation, cabType, bookingStatus, fare);

                // Set attributes for JSP
                request.setAttribute("customerName", customerName);
                request.setAttribute("phone", phone);
                request.setAttribute("startLocation", startLocation);
                request.setAttribute("endLocation", endLocation);
                request.setAttribute("cabType", cabType);
                request.setAttribute("bookingStatus", bookingStatus);
                request.setAttribute("fare", fare);

                // Forward to billing.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("billing.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("error.jsp?error=booking_not_found");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=db_error");
        } finally {
            closeConnection(conn, stmt, rs);
        }
    }

    private void saveBillToDatabase(String bookingId, String customerName, String phone, String pickup, String dropoff, String cabType, String status, double fare) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String insertQuery = "INSERT INTO billing (booking_id, customer_name, phone, pickup_location, dropoff_location, cab_type, booking_status, fare) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, bookingId);
            stmt.setString(2, customerName);
            stmt.setString(3, phone);
            stmt.setString(4, pickup);
            stmt.setString(5, dropoff);
            stmt.setString(6, cabType);
            stmt.setString(7, status);
            stmt.setDouble(8, fare);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Bill saved successfully!");
            } else {
                System.out.println("Failed to save bill.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, stmt, null);
        }
    }

    private double calculateFare(String cabType) {
        switch (cabType.toLowerCase()) {
            case "sedan":
                return 1000;
            case "suv":
                return 1500;
            default:
                return 1200;
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
}
