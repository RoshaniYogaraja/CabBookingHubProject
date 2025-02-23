
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CabServlet")
public class CabServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "save":
                saveCab(request, response);
                break;
            case "edit":
                editCab(request, response);
                break;
            case "delete":
                deleteCab(request, response);
                break;
            default:
                response.sendRedirect("cab.jsp?status=success&message=Cab added successfully");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getCabs(request, response);
    }

    private void saveCab(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String type = request.getParameter("type");
        String model = request.getParameter("model");
        String registrationNumber = request.getParameter("registrationNumber");
        int seatingCapacity = Integer.parseInt(request.getParameter("seatingCapacity"));
        String status = request.getParameter("status");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String query = "INSERT INTO cabs (type, model, registration_number, seating_capacity, status) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, type);
            stmt.setString(2, model);
            stmt.setString(3, registrationNumber);
            stmt.setInt(4, seatingCapacity);
            stmt.setString(5, status);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("Admin/cab.jsp?success=saved");
            } else {
                response.sendRedirect("Admin/cab.jsp?error=db_error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("cab.jsp?error=db_error");
        } finally {
            closeConnection(conn, stmt, null);
        }
    }

    private void editCab(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type");
        String model = request.getParameter("model");
        String registrationNumber = request.getParameter("registrationNumber");
        int seatingCapacity = Integer.parseInt(request.getParameter("seatingCapacity"));
        String status = request.getParameter("status");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String query = "UPDATE cabs SET type = ?, model = ?, registration_number = ?, seating_capacity = ?, status = ? WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, type);
            stmt.setString(2, model);
            stmt.setString(3, registrationNumber);
            stmt.setInt(4, seatingCapacity);
            stmt.setString(5, status);
            stmt.setInt(6, id);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("Admin/cab.jsp?success=updated");
            } else {
                response.sendRedirect("Admin/cab.jsp?error=db_error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Admin/cab.jsp?error=db_error");
        } finally {
            closeConnection(conn, stmt, null);
        }
    }

    private void deleteCab(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));  // FIX: Ensure the parameter name matches

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String query = "DELETE FROM cabs WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("Admin/cab.jsp?success=deleted"); 
            } else {
                response.sendRedirect("Admin/cab.jsp?error=db_error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Admin/cab.jsp?error=db_error");
        } finally {
            closeConnection(conn, stmt, null);
        }
    }

    private void getCabs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            String query = "SELECT * FROM cabs";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            List<String> cabs = new ArrayList<>();
            while (rs.next()) {
                cabs.add(rs.getInt("id") + "," + rs.getString("type") + "," + rs.getString("model") + "," + rs.getString("registration_number") + "," + rs.getInt("seating_capacity") + "," + rs.getString("status"));
            }
            request.setAttribute("cabs", cabs);
            request.getRequestDispatcher("cab.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            closeConnection(conn, stmt, rs);
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
