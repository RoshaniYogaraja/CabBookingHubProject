<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session to log out the user
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout - Cab Booking Hub</title>
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
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        .logout-card h1 {
            font-size: 1.8rem;
            color: #ffc727;
            margin-bottom: 15px;
        }

        .logout-card p {
            font-size: 1rem;
            color: black;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #ffc727;
            border-color: #ffc727;
            padding: 10px 20px;
        }

        .btn-primary:hover {
            background-color: #fcd34d;
            border-color: #fcd34d;
        }
    </style>
</head>
<body>
    <div class="logout-card">
        <h1>Logged Out Successfully</h1>
        <p>You have been logged out of your account. Click below to log in again or return to the homepage.</p>
        <a href="login.jsp" class="btn btn-primary">
            <i class="fas fa-sign-in-alt"></i> Log In
        </a>
        <a href="index.jsp" class="btn btn-secondary">
            <i class="fas fa-home"></i> Home
        </a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
