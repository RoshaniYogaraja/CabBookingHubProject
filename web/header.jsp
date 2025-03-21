<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cab Booking Hub</title>
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
    </head>
    <body class="min-h-screen transition-colors duration-300 bg-white text-gray-900 dark:bg-gray-900 dark:text-white">
        <nav class="relative z-10 shadow-md w-full bg-white dark:bg-gray-900 transition-colors duration-300">
            <div class="container mx-auto py-4">
                <div class="flex items-center justify-between px-4">
                    <a href="index..jsp" class="text-3xl font-bold">
                        <span class="text-gray-900 dark:text-white">Cab</span>
                        <span class="text-primary">Booking</span>
                        <span class="text-primary">Hub</span>
                    </a>

                    <div class="flex items-center gap-8 ml-auto"> 
                        <ul class="flex items-center gap-8"> 
                            <li><a href="index.jsp" class="text-2xl font-medium text-gray-900 dark:text-white hover:text-primary transition-colors duration-300">Home</a></li> <!-- Increased font size and added hover effect -->
                            <li><a href="#aboutus" class="text-2xl font-medium text-gray-900 dark:text-white hover:text-primary transition-colors duration-300">About Us</a></li>
                            <li><a href="#booking" class="text-2xl font-medium text-gray-900 dark:text-white hover:text-primary transition-colors duration-300">Booking</a></li>
                            <li><a href="#contactus" class="text-2xl font-medium text-gray-900 dark:text-white hover:text-primary transition-colors duration-300">Contact Us</a></li>
                        </ul>
                        <a href="login.jsp" class="bg-primary text-black px-8 py-3 rounded-full text-xl font-medium">Login</a> <!-- Increased padding and font size for Login button -->
                        <!-- Theme Toggle Button -->
                        <button onclick="toggleTheme()" class="p-3 text-gray-900 dark:text-white">
                            <svg id="lightIcon" xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z" />
                            </svg>
                            <svg id="darkIcon" xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </nav>
    </body>
</html>
