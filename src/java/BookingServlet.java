import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

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

    private void bookCab(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String startLocation = request.getParameter("start");
        String endLocation = request.getParameter("end");
        String cabType = request.getParameter("cab");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Explicitly load MySQL JDBC driver
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String query = "INSERT INTO bookings (customer_name, phone, pickup_location, dropoff_location, cab_type, booking_status) VALUES (?, ?, ?, ?, ?, 'Confirmed')";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, startLocation);
            stmt.setString(4, endLocation);
            stmt.setString(5, cabType);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("confirmation.jsp");
            } else {
                response.sendRedirect("bookingFailed.jsp?error=db_error");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();  // This will print the error to the server log (check your server logs)
            response.sendRedirect("bookingFailed.jsp?error=db_error");
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