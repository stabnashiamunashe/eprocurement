<div class="container mx-auto py-8">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold">Vendors</h1>
        <div class="flex items-center space-x-4">
            <!-- Tender Status Filter -->
            <div>
                <label for="tenderStatus" class="mr-2 text-sm text-gray-700">Tender Status:</label>
                <select id="tenderStatus" class="px-4 py-2 border border-gray-300 rounded-md text-sm">
                    <option value="all">All</option>
                    <option value="open">Open</option>
                    <option value="closed">Closed</option>
                </select>
            </div>

            <!-- Closing Date Filter -->
            <div>
                <label for="closingDate" class="mr-2 text-sm text-gray-700">Closing Date:</label>
                <select id="closingDate" class="px-4 py-2 border border-gray-300 rounded-md text-sm">
                    <option value="all">All Dates</option>
                    <option value="thisWeek">This Week</option>
                    <option value="thisMonth">This Month</option>
                    <option value="nextMonth">Next Month</option>
                </select>
            </div>

            <!-- Release Date Filter -->
            <div>
                <label for="releaseDate" class="mr-2 text-sm text-gray-700">Release Date:</label>
                <select id="releaseDate" class="px-4 py-2 border border-gray-300 rounded-md text-sm">
                    <option value="all">All Dates</option>
                    <option value="lastWeek">Last Week</option>
                    <option value="thisMonth">This Month</option>
                    <option value="lastMonth">Last Month</option>
                </select>
            </div>

            <!-- Items per Page -->
            <div>
                <label for="itemsPerPage" class="mr-2 text-sm text-gray-700">Items per Page:</label>
                <select id="itemsPerPage" class="px-4 py-2 border border-gray-300 rounded-md text-sm">
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                </select>
            </div>

            <!-- Search Input -->
            <div class="relative">
                <input
                        type="text"
                        placeholder="Search..."
                        class="px-4 py-2 border border-gray-300 rounded-md pr-8 text-sm"
                >
                <button class="absolute right-2 top-1/2 transform -translate-y-1/2">
                    <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <div class="grid grid-cols-1 gap-0">

        @template.components.tendercard()

        @template.components.tendercard()

        @template.components.tendercard()

        @template.components.tendercard()

    </div>

    <div class="flex justify-end mt-6">
        <div class="inline-flex -space-x-px">
            <a href="#" class="px-3 py-2 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg hover:bg-gray-100 hover:text-gray-700">
                Previous
            </a>
            <a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
                1
            </a>
            <a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
                2
            </a>
            <a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
                3
            </a>
            <a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg hover:bg-gray-100 hover:text-gray-700">
                Next
            </a>
        </div>
    </div>

    <%--    PAGINATION USING THYMELEAF--%>
    <%--    <div class="flex justify-end mt-6">--%>
    <%--        <div class="inline-flex -space-x-px">--%>
    <%--            <!-- Previous Button -->--%>
    <%--            <a href="/items?page=1"--%>
    <%--               class="px-3 py-2 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg hover:bg-gray-100 hover:text-gray-700">--%>
    <%--                Previous--%>
    <%--            </a>--%>

    <%--            <!-- Page Numbers -->--%>
    <%--            <a href="/items?page=1"--%>
    <%--               class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">--%>
    <%--                1--%>
    <%--            </a>--%>
    <%--            <a href="/items?page=2"--%>
    <%--               class="px-3 py-2 leading-tight text-white bg-indigo-500 border border-gray-300 hover:bg-indigo-600">--%>
    <%--                2--%>
    <%--            </a>--%>
    <%--            <a href="/items?page=3"--%>
    <%--               class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">--%>
    <%--                3--%>
    <%--            </a>--%>
    <%--            <a href="/items?page=4"--%>
    <%--               class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">--%>
    <%--                4--%>
    <%--            </a>--%>
    <%--            <a href="/items?page=5"--%>
    <%--               class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">--%>
    <%--                5--%>
    <%--            </a>--%>

    <%--            <!-- Next Button -->--%>
    <%--            <a href="/items?page=3"--%>
    <%--               class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg hover:bg-gray-100 hover:text-gray-700">--%>
    <%--                Next--%>
    <%--            </a>--%>
    <%--        </div>--%>
    <%--    </div>--%>

</div>
