import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String startLocation = request.getParameter("start");
        String endLocation = request.getParameter("end");
        String vehicle = request.getParameter("vehicle");

        // Try-with-resources to handle automatic resource management
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(
                     "INSERT INTO bookings (customer_name, phone, pickup_location, dropoff_location, vehicle, booking_status) VALUES (?, ?, ?, ?, ?, 'Confirmed')")) {

            pstmt.setString(1, name);
            pstmt.setString(2, phone);
            pstmt.setString(3, startLocation);
            pstmt.setString(4, endLocation);
            pstmt.setString(5, vehicle);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("booking_success.jsp"); // Successful booking
            } else {
                response.sendRedirect("booking_failed.jsp"); // Failure handling
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Error page
        }
    }
}
