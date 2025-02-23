
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DriverServlet")
public class DriverServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "save":
                saveDriver(request, response);
                break;
            case "edit":
                editDriver(request, response);
                break;
            case "delete":
                deleteDriver(request, response);
                break;
            default:
                response.sendRedirect("driver.jsp?status=success&message=Driver added successfully");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getDrivers(request, response);
    }

    private void saveDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String driverName = request.getParameter("driverName");
        String licenseNumber = request.getParameter("licenseNumber");
        String phone = request.getParameter("phone");
        String vehicleAssigned = request.getParameter("vehicleAssigned");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String query = "INSERT INTO drivers (name, license_number, phone, vehicle_assigned) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, driverName);
            stmt.setString(2, licenseNumber);
            stmt.setString(3, phone);
            stmt.setString(4, vehicleAssigned);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("Admin/driver.jsp?success=saved");
            } else {
                response.sendRedirect("driver.jsp?error=db_error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("driver.jsp?error=db_error");
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void editDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int driverId = Integer.parseInt(request.getParameter("driverId"));
        String driverName = request.getParameter("driverName");
        String licenseNumber = request.getParameter("licenseNumber");
        String phone = request.getParameter("phone");
        String vehicleAssigned = request.getParameter("vehicleAssigned");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String query = "UPDATE drivers SET name = ?, license_number = ?, phone = ?, vehicle_assigned = ? WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, driverName);
            stmt.setString(2, licenseNumber);
            stmt.setString(3, phone);
            stmt.setString(4, vehicleAssigned);
            stmt.setInt(5, driverId);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("driver.jsp?success=updated");
            } else {
                response.sendRedirect("driver.jsp?error=db_error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("driver.jsp?error=db_error");
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int driverId = Integer.parseInt(request.getParameter("driverId"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String query = "DELETE FROM drivers WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, driverId);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("driver.jsp?success=deleted");
            } else {
                response.sendRedirect("driver.jsp?error=db_error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("driver.jsp?error=db_error");
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void getDrivers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            String query = "SELECT * FROM drivers";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            List<String> drivers = new ArrayList<>();
            while (rs.next()) {
                drivers.add(rs.getInt("id") + "," + rs.getString("name") + "," + rs.getString("license_number") + "," + rs.getString("phone") + "," + rs.getString("vehicle_assigned"));
            }
            response.setContentType("text/plain");
            response.getWriter().write(String.join("\n", drivers));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
