@import tech.stabnashiamunashe.eprocurement.Security.CsrfHiddenInput
@param CsrfHiddenInput csrfHiddenInput
@param String email

@template.layout.maindashboard(content = @`
    <div class="mt-6">
        @template.components.statistics-card()
    </div>

    <div class="mt-6">
        @template.components.metrics-cards()
    </div>

    <div class="mt-6">
        <div class="bg-white shadow-md rounded-lg">
            <div class="p-6">
                <h3 class="text-lg font-semibold">Tender 123</h3>
                <div class="grid grid-cols-2 gap-4 mt-4">
                    <div>
                        <p class="text-gray-500 text-sm">Tender Reference</p>
                        <p class="text-gray-700 text-sm">ABC-123</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Supplier Category Code</p>
                        <p class="text-gray-700 text-sm">SCC-456</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Supplier Category Name</p>
                        <p class="text-gray-700 text-sm">Widgets</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Procuring Entity</p>
                        <p class="text-gray-700 text-sm">ABC Corp</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Scope</p>
                        <p class="text-gray-700 text-sm">Provision of widgets</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Publish Date</p>
                        <p class="text-gray-700 text-sm">2023-04-01</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Closing Date</p>
                        <p class="text-gray-700 text-sm">2023-05-15</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="mt-6">
        <div class="bg-white shadow-lg rounded-xl">
            <div class="p-6">
                <div class="flex items-center justify-between">
                    <h3 class="text-xl font-bold">Tender 123</h3>
                    <div class="bg-teal-500 text-white px-3 py-1 rounded-full text-sm">Open</div>
                </div>
                <div class="grid grid-cols-2 gap-4 mt-6">
                    <div>
                        <p class="text-gray-500 text-sm">Tender Reference</p>
                        <p class="text-gray-700 text-base font-medium">ABC-123</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Supplier Category Code</p>
                        <p class="text-gray-700 text-base font-medium">SCC-456</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Supplier Category Name</p>
                        <p class="text-gray-700 text-base font-medium">Widgets</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Procuring Entity</p>
                        <p class="text-gray-700 text-base font-medium">ABC Corp</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Scope</p>
                        <p class="text-gray-700 text-base font-medium">Provision of widgets</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Publish Date</p>
                        <p class="text-gray-700 text-base font-medium">2023-04-01</p>
                    </div>
                    <div>
                        <p class="text-gray-500 text-sm">Closing Date</p>
                        <p class="text-gray-700 text-base font-medium">2023-05-15</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-6">
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
    </div>

    <div class="mt-6">
        <div class="flex justify-center mt-6">
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
    </div>
`, csrfHiddenInput = csrfHiddenInput, email = email )