
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

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String adminEmail = "admin@gmail.com";
        String adminPassword = "admin";

        if (email.equals(adminEmail) && password.equals(adminPassword)) {
            // Admin login
            HttpSession session = request.getSession();
            session.setAttribute("user", email);
            session.setAttribute("role", "admin");
            response.sendRedirect("Admin/dashboard.jsp");
        } else {
            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

                // Prepare SQL query for checking the user in the database
                String query = "SELECT * FROM users WHERE email = ? AND password = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, email);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    // Create a session for the user
                    HttpSession session = request.getSession();
                    session.setAttribute("user", email);
                    session.setAttribute("role", "user");
                    response.sendRedirect("index.jsp");
                } else {
                    // Redirect to login page with error
                    response.sendRedirect("login.jsp?error=1");
                }
                rs.close();
                stmt.close();
                conn.close();

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("login.jsp?error=1");
            }
        }
    }
}
