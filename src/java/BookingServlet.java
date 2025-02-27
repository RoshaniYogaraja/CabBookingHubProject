
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

    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getAvailableCabs(request, response);
    }

    private void getAvailableCabs(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String query = "SELECT id, type, model, registration_number, status FROM cabs WHERE status = 'Available'";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            List<String> availableCabs = new ArrayList<>();
            while (rs.next()) {
                String cabInfo = rs.getInt("id") + "," + rs.getString("type") + ","
                        + rs.getString("model") + "," + rs.getString("registration_number") + ","
                        + rs.getString("status");
                availableCabs.add(cabInfo);
            }

            // Debugging Output - Log cabs fetched
            System.out.println("Available Cabs from DB: " + availableCabs);

            if (availableCabs.isEmpty()) {
                System.out.println("No available cabs in database.");
            }

            request.setAttribute("availableCabs", availableCabs);
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, stmt, rs);
        }
    }

    private void bookCab(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String startLocation = request.getParameter("start");
        String endLocation = request.getParameter("end");
        String cabId = request.getParameter("cab");

        Connection conn = null;
        PreparedStatement stmt = null;
        PreparedStatement updateStmt = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            conn.setAutoCommit(false); // Start transaction

            // Check if cab is still available before booking
            String checkQuery = "SELECT status FROM cabs WHERE id = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, cabId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next() && "Available".equals(rs.getString("status"))) {
                // Insert booking record
                String insertQuery = "INSERT INTO bookings (customer_name, phone, pickup_location, dropoff_location, cab_id, booking_status) VALUES (?, ?, ?, ?, ?, 'Confirmed')";
                stmt = conn.prepareStatement(insertQuery);
                stmt.setString(1, name);
                stmt.setString(2, phone);
                stmt.setString(3, startLocation);
                stmt.setString(4, endLocation);
                stmt.setString(5, cabId);

                int rowsInserted = stmt.executeUpdate();

                if (rowsInserted > 0) {
                    // Update the cab status to 'Booked'
                    String updateQuery = "UPDATE cabs SET status = 'Booked' WHERE id = ?";
                    updateStmt = conn.prepareStatement(updateQuery);
                    updateStmt.setString(1, cabId);
                    updateStmt.executeUpdate();

                    conn.commit(); // Commit transaction
                    response.sendRedirect("bookingSuccess.jsp");
                } else {
                    conn.rollback(); // Rollback in case of failure
                    response.sendRedirect("bookingFailed.jsp?error=db_error");
                }
            } else {
                response.sendRedirect("bookingFailed.jsp?error=cab_not_available");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (conn != null) {
                    conn.rollback(); // Rollback transaction on error
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            response.sendRedirect("bookingFailed.jsp?error=db_error");
        } finally {
            closeConnection(null, stmt, null);
            closeConnection(null, updateStmt, null);
            closeConnection(conn, null, null);
        }
    }

    private void closeConnection(Connection conn, PreparedStatement stmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
