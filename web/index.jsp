<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cab Booking Hub</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css">
        <script src="https://cdn.tailwindcss.com"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                tailwind.config = {
                    darkMode: 'class',
                    theme: {
                        extend: {
                            colors: {
                                primary: "#ffc727",
                            }
                        }
                    }
                };

                function initializeTheme() {
                    const storedTheme = localStorage.getItem('theme');
                    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;

                    if (storedTheme === 'dark' || (!storedTheme && prefersDark)) {
                        document.documentElement.classList.add('dark');
                    } else {
                        document.documentElement.classList.remove('dark');
                    }
                    updateThemeIcon();
                }

                function toggleTheme() {
                    const root = document.documentElement;
                    const isDark = root.classList.contains('dark');

                    if (isDark) {
                        root.classList.remove('dark');
                        localStorage.setItem('theme', 'light');
                    } else {
                        root.classList.add('dark');
                        localStorage.setItem('theme', 'dark');
                    }
                    updateThemeIcon();
                }

                function updateThemeIcon() {
                    const darkIcon = document.getElementById('darkIcon');
                    const lightIcon = document.getElementById('lightIcon');
                    const isDark = document.documentElement.classList.contains('dark');

                    if (isDark) {
                        darkIcon.classList.add('hidden');
                        lightIcon.classList.remove('hidden');
                    } else {
                        darkIcon.classList.remove('hidden');
                        lightIcon.classList.add('hidden');
                    }
                }

                window.toggleTheme = toggleTheme;
                initializeTheme();
            });
        </script>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #f9fafb;
            }
            .hero-container {
                background-image: url('assets/city1.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                color: white;
                position: relative;
            }
            .hero-overlay {
                background: rgba(0, 0, 0, 0.6);
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
            .hero-text {
                position: relative;
                z-index: 10;
            }
            .hero-text h1 {
                font-size: 56px;
                font-weight: bold;
                margin-bottom: 16px;
            }
            .hero-text p {
                font-size: 24px;
                margin-bottom: 24px;
            }
            .hero-text a {
                background-color: #ffc727;
                color: black;
                padding: 12px 24px;
                font-size: 18px;
                border-radius: 8px;
                text-decoration: none;
                font-weight: bold;
            }
        </style>
    </head>
    <body class="transition-colors duration-300 bg-white text-gray-900 dark:bg-gray-900 dark:text-white">
        <!-- Navbar -->
        <nav class="relative z-10 shadow-md w-full bg-white dark:bg-gray-900 transition-colors duration-300">
            <div class="container mx-auto py-4">
                <div class="flex items-center justify-between px-4">
                    <a href="index.jsp" class="text-3xl font-bold">
                        <span class="text-gray-900 dark:text-white">Cab</span>
                        <span class="text-primary">Booking</span>
                        <span class="text-primary">Hub</span>
                    </a>

                    <div class="hidden md:flex items-center gap-6">
                        <ul class="flex items-center gap-6">
                            <li><a href="index.jsp" class="text-lg font-medium text-gray-900 dark:text-white">Home</a></li>
                            <li><a href="#aboutus" class="text-lg font-medium text-gray-900 dark:text-white">About Us</a></li>
                            <li><a href="#booking" class="text-lg font-medium text-gray-900 dark:text-white">Booking</a></li>
                            <li><a href="#contactus" class="text-lg font-medium text-gray-900 dark:text-white">Contact Us</a></li>
                        </ul>
                        <a href="login.jsp" class="bg-primary text-black px-6 py-2 rounded-full">Login</a>

                        <!-- Theme Toggle Button -->
                        <button onclick="toggleTheme()" class="p-2 text-gray-900 dark:text-white">
                            <svg id="lightIcon" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
                            </svg>
                            <svg id="darkIcon" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <div class="hero-container">
            <div class="hero-overlay"></div>
            <div class="hero-text" data-aos="fade-up">
                <h1>Welcome to Cab Booking Hub</h1>
                <p>Your trusted partner for cab bookings!</p>
                <a href="#booking">Book Now</a>
            </div>
        </div>

        <!-- About Us Section -->
        <section id="aboutus" class="py-16 bg-gray-100 dark:bg-gray-800">
            <jsp:include page="aboutus.jsp" />
        </section>

        <!-- Booking Section -->
        <section id="booking" class="py-16 bg-white dark:bg-gray-900">
            <jsp:include page="booking.jsp" />
        </section>

        <!-- Contact Us Section -->
        <section id="contactus" class="py-16 bg-gray-100 dark:bg-gray-800">
            <jsp:include page="contactus.jsp" />
        </section>
        
        <!-- Footer -->
        <section class="py-16">
            <jsp:include page="footer.jsp" />
        </section>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        <script>
            AOS.init({
                duration: 800,
                offset: 120,
                once: true
            });
        </script>
    </body>
</html>
