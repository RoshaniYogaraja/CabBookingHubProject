import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/GetUsersServlet")
public class GetUsersServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/cab_booking";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> users = new ArrayList<>();
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("phoneNo"),
                        rs.getString("role"),
                        rs.getString("created_at")
                );
                users.add(user);
            }

            request.setAttribute("users", users);
            request.getRequestDispatcher("Admin/user.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=db_error");
        }
    }

    public static class User {
        private int id;
        private String fullName;
        private String email;
        private String address;
        private String phoneNo;
        private String role;
        private String createdAt;

        public User(int id, String fullName, String email, String address,String phoneNo, String role, String createdAt) {
            this.id = id;
            this.fullName = fullName;
            this.email = email;
            this.address = address;
            this.phoneNo = phoneNo;
            this.role = role;
            this.createdAt = createdAt;
        }

        public int getId() { return id; }
        public String getFullName() { return fullName; }
        public String getEmail() { return email; }
        public String getAddress() { return address; }
        public String getPhoneNo() { return phoneNo; }
        public String getRole() { return role; }
        public String getCreatedAt() { return createdAt; }
    }
}