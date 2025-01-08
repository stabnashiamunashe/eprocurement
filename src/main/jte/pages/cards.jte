@template.layout.main(content = @`
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        <!-- Card 1 -->
        <div class="bg-white rounded-lg shadow-md p-4">
            <div class="flex items-center">
                <div class="p-3 rounded-full bg-blue-100 text-blue-500">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m-2-2h6a2 2 0 011.874 2.995l-.034.005H8.125a2 2 0 01-1.874-2.995L6.25 10z" />
                    </svg>
                </div>
                <div class="ml-4">
                    <p class="text-lg font-semibold text-gray-800">1,245</p>
                    <p class="text-sm text-gray-500">Users</p>
                </div>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="bg-white rounded-lg shadow-md p-4">
            <div class="flex items-center">
                <div class="p-3 rounded-full bg-green-100 text-green-500">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a9 9 0 10-18 0v2h5m-5-10h20a9 9 0 11-20 0z" />
                    </svg>
                </div>
                <div class="ml-4">
                    <p class="text-lg font-semibold text-gray-800">$25,650</p>
                    <p class="text-sm text-gray-500">Revenue</p>
                </div>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="bg-white rounded-lg shadow-md p-4">
            <div class="flex items-center">
                <div class="p-3 rounded-full bg-yellow-100 text-yellow-500">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H4" />
                    </svg>
                </div>
                <div class="ml-4">
                    <p class="text-lg font-semibold text-gray-800">457</p>
                    <p class="text-sm text-gray-500">Tenders</p>
                </div>
            </div>
        </div>

        <!-- Card 4 -->
        <div class="bg-white rounded-lg shadow-md p-4">
            <div class="flex items-center">
                <div class="p-3 rounded-full bg-red-100 text-red-500">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 9l4-4 4 4m0 6l-4 4-4-4" />
                    </svg>
                </div>
                <div class="ml-4">
                    <p class="text-lg font-semibold text-gray-800">75</p>
                    <p class="text-sm text-gray-500">Departments</p>
                </div>
            </div>
        </div>
    </div>
`)