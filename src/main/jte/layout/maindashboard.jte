@import tech.stabnashiamunashe.eprocurement.Security.CsrfHiddenInput
@param gg.jte.Content content
@param CsrfHiddenInput csrfHiddenInput
@param String email = "user"

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Government E-Procurement Platform</title>

    <link rel="icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/0/01/Coat_of_arms_of_Zimbabwe.svg">

    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/htmx.org@1.9.2"></script>
    <style>
        /* Disable overscroll bounce effect */
        body {
            overscroll-behavior: none;
        }

        #dropdown.hidden {
            display: none;
        }

        #emailDropdown {
            display: none;
        }

        /* Show dropdown when the button is focused or active */
        #emailButton:focus + #emailDropdown,
        #emailButton:active + #emailDropdown {
            display: block;
        }
    </style>
</head>
<body class="bg-gray-100">
<div class="flex min-h-screen">
    <!-- Sidebar -->
    <nav id="sidebar" class="bg-emerald-950 w-64 h-screen p-4 sticky top-0 z-20">
        <div class="flex items-center justify-between mb-8 lg:justify-center">
            <img class="h-8 w-8" src="https://upload.wikimedia.org/wikipedia/commons/0/01/Coat_of_arms_of_Zimbabwe.svg" alt="Your Company">
            <button id="closeSidebar" class="text-white lg:hidden focus:outline-none">✕</button>
        </div>
        <div class="space-y-2">
            <a href="/" class="block bg-teal-800 text-white rounded-md px-3 py-2 text-sm font-medium">Dashboard</a>
            <a href="/departments" class="block text-gray-300 hover:bg-teal-800 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Departments</a>
            <a href="/tenders" class="block text-gray-300 hover:bg-teal-800 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Tenders</a>
            <a href="/regulatory" class="block text-gray-300 hover:bg-teal-800 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Regulatory Authority</a>
            <a href="/settings" class="block text-gray-300 hover:bg-teal-800 hover:text-white rounded-md px-3 py-2 text-sm font-medium">Settings</a>
            <a href="/regulatory" class="sticky bottom-6 block text-gray-300 hover:bg-teal-800 hover:text-white rounded-md px-3 py-2 text-sm font-medium">My Authority</a>
        </div>

        <!-- Settings link at the bottom -->

    </nav>

    <!-- Main content -->
    <div class="flex-1 lg:pl-0">
        <!-- Header with Search and User Settings -->
        <header class="bg-white shadow-md p-4 sticky top-0 z-10">
            <div class="flex justify-between items-center max-w-7xl mx-auto">
                <!-- Search Bar -->
                <div class="relative w-full">
                    <input type="text" id="searchInput" placeholder="Search..."
                           class="w-full px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-green-600"
                           oninput="handleSearch(this.value)" />
                    <div id="dropdown"
                         class="absolute w-full mt-2 bg-white border border-gray-300 rounded-md shadow-lg hidden z-10">
                        <!-- Tenders Category -->
                        <div id="tendersCategory" class="px-4 py-2">
                            <h3 class="text-sm font-semibold text-gray-700 border-b pb-1">Tenders</h3>
                            <ul class="mt-2 space-y-2 text-gray-600">
                                <!-- Example Result -->
                                <li class="flex items-center space-x-4 p-2 hover:bg-gray-100 rounded cursor-pointer">
                                    <img src="https://via.placeholder.com/40" alt="Tender Image" class="h-10 w-10 rounded-full">
                                    <div>
                                        <p class="text-gray-800 font-medium">Tender 1</p>
                                        <p class="text-sm text-gray-500">Closing Date: 2024-12-31</p>
                                    </div>
                                </li>
                                <!-- More results will be dynamically added here -->
                            </ul>
                        </div>
                        <!-- Vendors Category -->
                        <div id="vendorsCategory" class="px-4 py-2">
                            <h3 class="text-sm font-semibold text-gray-700 border-b pb-1">Vendors</h3>
                            <ul class="mt-2 space-y-2 text-gray-600">
                                <!-- Example Result -->
                                <li class="flex items-center space-x-4 p-2 hover:bg-gray-100 rounded cursor-pointer">
                                    <img src="https://via.placeholder.com/40" alt="Vendor Logo" class="h-10 w-10 rounded-full">
                                    <div>
                                        <p class="text-gray-800 font-medium">Vendor A</p>
                                        <p class="text-sm text-gray-500">Location: Harare</p>
                                    </div>
                                </li>
                                <!-- More results will be dynamically added here -->
                            </ul>
                        </div>
                    </div>
                </div>


                <!-- User and Settings Icons -->
                <div class="relative">
                    <button id="emailButton" type="button"
                            class="flex items-center space-x-2 text-gray-500 border hover:border-green-600 focus:outline-none hover:shadow-[0_0_8px_rgba(99,102,241,0.6)] px-3 py-2 rounded-md">
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                        </svg>
                        <span class="text-sm font-medium">${email}</span>
                    </button>
                    <div id="emailDropdown"
                         class="absolute right-0 mt-2 bg-white border border-gray-300 rounded-md shadow-lg hidden z-20 w-48">
                        <form action="/logout" method="post" class="border-b">
                            ${csrfHiddenInput}
                            <button type="submit"
                                    class="block w-full text-left px-4 py-2 bg-white hover:bg-gray-100 text-sm text-gray-700">
                                Logout
                            </button>
                        </form>
                        <form action="/settings" method="get">
                            <button type="submit"
                                    class="block w-full text-left px-4 py-2 bg-white hover:bg-gray-100 text-sm text-gray-700">
                                Settings
                            </button>
                        </form>
                    </div>
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

    const sampleData = {
        tenders: ["Tender 1", "Tender 2", "Tender 3"],
        vendors: ["Vendor A", "Vendor B", "Vendor C"]
    };

    function handleSearch(query) {
        const dropdown = document.getElementById('dropdown');
        const tendersList = document.getElementById('tendersCategory').querySelector('ul');
        const vendorsList = document.getElementById('vendorsCategory').querySelector('ul');

        // Clear previous results
        tendersList.innerHTML = '';
        vendorsList.innerHTML = '';

        // Filter and populate results
        if (query.trim() === '') {
            dropdown.classList.add('hidden');
            return;
        }

        dropdown.classList.remove('hidden');

        const filteredTenders = sampleData.tenders.filter(item =>
            item.toLowerCase().includes(query.toLowerCase())
        );
        const filteredVendors = sampleData.vendors.filter(item =>
            item.toLowerCase().includes(query.toLowerCase())
        );

        if (filteredTenders.length) {
            filteredTenders.forEach(item => {
                const li = document.createElement('li');
                li.textContent = item;
                li.classList.add('cursor-pointer', 'hover:bg-gray-100', 'px-2', 'py-1', 'rounded');
                li.addEventListener('click', () => handleResultClick(item));
                tendersList.appendChild(li);
            });
        }

        if (filteredVendors.length) {
            filteredVendors.forEach(item => {
                const li = document.createElement('li');
                li.textContent = item;
                li.classList.add('cursor-pointer', 'hover:bg-gray-100', 'px-2', 'py-1', 'rounded');
                li.addEventListener('click', () => handleResultClick(item));
                vendorsList.appendChild(li);
            });
        }

        // Hide dropdown if no results
        if (!filteredTenders.length && !filteredVendors.length) {
            dropdown.classList.add('hidden');
        }
    }

    function handleResultClick(result) {
        document.getElementById('dropdown').classList.add('hidden');
        document.getElementById('searchInput').value = result;
    }
</script>
</body>
</html>