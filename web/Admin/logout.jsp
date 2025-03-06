<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String message = request.getParameter("message");
    if (message == null) {
        message = "logged_out"; // Default message
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Logout - Mega City Cab</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f8f9fa;
            }

            .logout-card {
                background-color: white;
                border-radius: 12px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
                padding: 30px;
                text-align: center;
                width: 100%;
                max-width: 400px;
            }

            .logout-card h1 {
                font-size: 1.8rem;
                color: #ff9800;
                margin-bottom: 15px;
            }

            .logout-card p {
                font-size: 1rem;
                color: #555;
                margin-bottom: 20px;
            }

            .btn-primary {
                background-color: #ff9800;
                border-color: #ff9800;
                padding: 10px 20px;
                width: 100%;
            }

            .btn-primary:hover {
                background-color: #f57c00;
                border-color: #f57c00;
            }

            .btn-secondary {
                width: 100%;
            }

            .icon {
                font-size: 3rem;
                color: #ff9800;
            }
        </style>
    </head>
    <body>
        <div class="logout-card">
            <i class="fas fa-check-circle icon"></i>
            <h1>Logout Successful</h1>
            <% if ("logged_out".equals(message)) { %>
            <p>You have been logged out of your account.</p>
            <% } else { %>
            <p>Your session has expired. Please log in again.</p>
            <% }%>
            <a href="<%= request.getContextPath()%>/login.jsp" class="btn btn-primary mt-3">
                <i class="fas fa-sign-in-alt"></i> Log In
            </a>
            <a href="<%= request.getContextPath()%>/index.jsp" class="btn btn-secondary mt-2">
                <i class="fas fa-home"></i> Home
            </a>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
