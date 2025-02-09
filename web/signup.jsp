<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 h-screen flex flex-col">
    
    <!-- Include Navbar -->
    <jsp:include page="index.jsp" />

    <!-- Centered Signup Form -->
    <div class="flex justify-center items-center flex-grow">
        <div class="bg-white shadow-lg rounded-2xl p-6 w-96">
            <h2 class="text-xl font-bold text-center text-black">Signup</h2>
            <p class="text-gray-500 text-center mb-4 text-sm">Create an account to get started</p>

            <form action="signupServlet" method="post">
                <!-- Full Name -->
                <div class="mb-3">
                    <label class="block text-black font-medium text-sm">Full Name</label>
                    <input type="text" name="fullName" placeholder="Enter your name" required
                        class="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-yellow-400 outline-none text-sm">
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label class="block text-black font-medium text-sm">Email</label>
                    <input type="email" name="email" placeholder="Enter your email" required
                        class="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-yellow-400 outline-none text-sm">
                </div>

                <!-- Password -->
                <div class="mb-3 relative">
                    <label class="block text-black font-medium text-sm">Password</label>
                    <input type="password" name="password" id="password" placeholder="Enter your password" required
                        class="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-yellow-400 outline-none text-sm">
                    <button type="button" class="absolute right-3 top-8 text-gray-500" onclick="togglePassword('password', 'toggleIcon1')">
                        <i id="toggleIcon1" class="fa-solid fa-eye-slash"></i>
                    </button>
                </div>

                <!-- Confirm Password -->
                <div class="mb-3 relative">
                    <label class="block text-black font-medium text-sm">Confirm Password</label>
                    <input type="password" id="confirmPassword" placeholder="Confirm your password" required
                        class="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-yellow-400 outline-none text-sm">
                    <button type="button" class="absolute right-3 top-8 text-gray-500" onclick="togglePassword('confirmPassword', 'toggleIcon2')">
                        <i id="toggleIcon2" class="fa-solid fa-eye-slash"></i>
                    </button>
                </div>

                <!-- Signup Button -->
                <button type="submit" class="w-full bg-yellow-500 text-black font-bold py-2 rounded-lg hover:bg-yellow-600 transition text-sm">
                    SIGNUP
                </button>

                <!-- Login Link -->
                <p class="text-center text-gray-600 mt-3 text-[15px]">Already have an account?
                    <a href="login.jsp" class="text-yellow-600 font-semibold hover:underline">Login</a>
                </p>
            </form>
        </div>
    </div>

    <script>
        function togglePassword(inputId, iconId) {
            const passwordField = document.getElementById(inputId);
            const icon = document.getElementById(iconId);
            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            } else {
                passwordField.type = "password";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            }
        }
    </script>
</body>
</html>