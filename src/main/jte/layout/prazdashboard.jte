@param gg.jte.Content content

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Government E-Procurement Platform</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Disable overscroll bounce effect */
        body {
            overscroll-behavior: none;
        }
    </style>
</head>
<body class="bg-gray-100">
<div class="flex min-h-screen">
    <!-- Sidebar -->
    <nav id="sidebar" class="bg-gray-800 w-64 h-screen p-4 sticky top-0 z-20">
        <div class="flex items-center justify-between mb-8 lg:justify-center">
            <img class="h-8 w-8" src="https://upload.wikimedia.org/wikipedia/commons/0/01/Coat_of_arms_of_Zimbabwe.svg" alt="Your Company">
            <button id="closeSidebar" class="text-white lg:hidden focus:outline-none">✕</button>
        </div>
        <div class="space-y-2">
            <a href="/" class="block bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium">Dashboard</a>
            <a href="/departments" class="block text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Departments</a>
            <a href="/tenders" class="block text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Tenders</a>
            <a href="/regulatory" class="block text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Regulatory Authority</a>
        </div>
    </nav>

    <!-- Main content -->
    <div class="flex-1 lg:pl-0">
        <!-- Header with Search and User Settings -->
        <header class="bg-white shadow-md p-4 sticky top-0 z-10">
            <div class="flex justify-between items-center max-w-7xl mx-auto">
                <!-- Search Bar -->
                <div class="flex-1">
                    <input type="text" placeholder="Search..."
                           class="w-full px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-indigo-600">
                </div>

                <!-- User and Settings Icons -->
                <div class="flex items-center space-x-4 ml-4">
                    <button class="flex items-center space-x-2 text-gray-500 border hover:border-indigo-500 focus:outline-none hover:shadow-[0_0_8px_rgba(99,102,241,0.6)] px-3 py-2 rounded-md">
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                        </svg>
                        <span class="text-sm font-medium">user@example.com</span>
                    </button>
                </div>
            </div>
        </header>

        <!-- Mobile Toggle Button -->
        <header class="bg-gray-800 p-4 lg:hidden">
            <button id="openSidebar" class="text-white focus:outline-none">☰</button>
        </header>

        <main class="p-6 overflow-auto">
            <div class="max-w-7xl mx-auto">
                <!-- Content will be injected here -->
                ${content}
            </div>
        </main>
    </div>
</div>

<script>
    const sidebar = document.getElementById('sidebar');
    const openSidebar = document.getElementById('openSidebar');
    const closeSidebar = document.getElementById('closeSidebar');

    openSidebar.addEventListener('click', () => {
        sidebar.classList.remove('-translate-x-full');
    });

    closeSidebar.addEventListener('click', () => {
        sidebar.classList.add('-translate-x-full');
    });
</script>
</body>
</html>