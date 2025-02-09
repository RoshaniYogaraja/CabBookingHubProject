<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Cab Booking Hub</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex flex-col min-h-screen">

    <!-- Include Navbar -->
    <jsp:include page="index.jsp" />

    <!-- Main Content -->
    <div class="flex-grow flex items-center justify-center px-6 py-5"> <!-- Add padding here for spacing -->
        <div class="bg-white shadow-lg rounded-2xl p-8 w-96">
            <h2 class="text-2xl font-bold text-center text-black">Login</h2>
            <p class="text-gray-500 text-center mb-6">Please login to continue</p>

            <%-- Display Error Message if Login Fails --%>
            <% String error = request.getParameter("error"); 
               if (error != null) { %>
                <p class="text-red-500 text-center"><i class="fa-solid fa-exclamation-circle"></i> Invalid email or password.</p>
            <% } %>

            <!-- Start of form -->
            <form action="LoginServlet" method="post">
                <!-- Email Field -->
                <div class="mb-4">
                    <label class="block text-black font-medium">Email</label>
                    <input type="email" name="email" placeholder="Enter your email"
                        class="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-yellow-400 outline-none" required>
                </div>

                <!-- Password Field -->
                <div class="mb-3 relative">
                    <label class="block text-black font-medium text-sm">Password</label>
                    <input type="password" name="password" id="password" placeholder="Enter your password"
                        class="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-yellow-400 outline-none text-sm" required>
                    <button type="button" class="absolute right-3 top-8 text-gray-500" onclick="togglePassword()">
                        <i id="toggleIcon" class="fa-solid fa-eye-slash"></i>
                    </button>
                </div>

                <!-- Forgot Password -->
                <div class="text-right mb-4">
                    <a href="#" class="text-yellow-600 hover:underline">Forgot password?</a>
                </div>

                <!-- Login Button -->
                <button class="w-full bg-yellow-500 text-black font-bold py-2 rounded-lg hover:bg-yellow-600 transition">
                    LOGIN
                </button>

                <!-- Register Link -->
                <p class="text-center text-gray-600 mt-4">Need an account?
                    <a href="signup.jsp" class="text-yellow-600 font-semibold hover:underline">Create One</a>
                </p>
            </form>
            <!-- End of form -->
        </div>
    </div>

    <!-- Footer -->
    <div class="text-center p-4 bg-gray-800 text-white mt-6">
        &copy; 2025 Cab Booking Hub. All Rights Reserved.
    </div>

    <script>
        function togglePassword() {
            const passwordField = document.getElementById("password");
            const icon = document.getElementById("toggleIcon");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.replace("fa-eye-slash", "fa-eye");
            } else {
                passwordField.type = "password";
                icon.classList.replace("fa-eye", "fa-eye-slash");
            }
        }
    </script>

</body>
</html>
