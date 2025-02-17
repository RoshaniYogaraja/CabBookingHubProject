import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cab_booking"; 
    private static final String JDBC_USER = "root"; 
    private static final String JDBC_PASSWORD = "root"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish connection
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Prepare SQL query
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, email);
            stmt.setString(2, password);

            // Execute query
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Create a session for the user
                HttpSession session = request.getSession();
                session.setAttribute("user", email);

                // Redirect based on the user's role
                String role = rs.getString("role");
                if ("admin".equals(role)) {
                    session.setAttribute("role", "admin");
                    response.sendRedirect("dashboard.jsp");
                } else {
                    session.setAttribute("role", "user");
                    response.sendRedirect("home.jsp");
                }
            } else {
                // Redirect to login page with error
                response.sendRedirect("login.jsp?error=1");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
