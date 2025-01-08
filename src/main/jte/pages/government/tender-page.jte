@import tech.stabnashiamunashe.eprocurement.Models.Tender
@import tech.stabnashiamunashe.eprocurement.Security.CsrfHiddenInput
@param Tender tender

@param CsrfHiddenInput csrfHiddenInput
@param String email


@template.layout.maindashboard(content = @`
    <style>
        /* Optional: Custom styles for timeline */
        .timeline-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: #4f46e5; /* Indigo */
        }
        .timeline-line {
            width: 2px;
            background-color: #d1d5db; /* Gray */
        }
    </style>

    <div class="container mx-auto py-6">
        <header class="mb-6 flex flex-wrap items-center justify-between gap-4">
            <h1 class="text-2xl font-bold text-gray-800">Tender Details</h1>
            <button id="bidButton"
                    class="bg-teal-800 text-white px-4 py-2 rounded-md hover:bg-green-800">
                Bid
            </button>
        </header>
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- Tender Details Card (2/3 Section) -->

            <div class="lg:col-span-2 bg-white shadow-lg rounded-lg overflow-hidden">
<%--                <div class="bg-gray-100 border-b border-gray-200 px-6 py-4">--%>
<%--                    <h2 class="text-2xl font-bold text-gray-800">Tender Details</h2>--%>
<%--                </div>--%>
                <div class="p-6 space-y-6">
                    <!-- General Info Section -->
                    <div>
                        <h3 class="text-xl font-semibold text-gray-700 border-b border-gray-200 pb-2 mb-4">General Information</h3>
                        <div class="space-y-3">
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Tender Id</span>
                                <span class="font-semibold">${tender.getId()}</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Status</span>
                                <span class="font-semibold">${tender.getStatus()}</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Bid Validity Period</span>
                                <span class="font-semibold">60 Days</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Tender Reference Number</span>
                                <span class="font-semibold">CM/RA/09/24</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Lot Type</span>
                                <span class="font-semibold">${tender.getLotType().getDisplayName()}</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Procurement Method</span>
                                <span class="font-semibold">${tender.getProcurementMethod().getDisplayName()}</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Class of Procurement</span>
                                <span class="font-semibold">${tender.getClassOfProcurement().getDisplayName()}</span>
                            </div>
                            <div class="flex items-center justify-between pb-2">
                                <span class="text-gray-600 font-medium">Funding Source</span>
                                <span class="font-semibold">${tender.getFundingSource().getDisplayName()}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Location & Supplier Info -->
                    <div>
                        <h3 class="text-xl font-semibold text-gray-700 border-b border-gray-200 pb-2 mb-4">Location & Supplier Information</h3>
                        <div class="space-y-3">
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Delivery Location</span>
                                <span class="font-semibold">Chitungwiza Municipality</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Supplier Categories</span>
                                <span class="font-semibold">Insurance and Brokerage Services</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Delivery Period</span>
                                <span class="font-semibold">3 Years</span>
                            </div>
                            <div class="flex items-center justify-between pb-2">
                                <span class="text-gray-600 font-medium">Procuring Entity</span>
                                <span class="font-semibold">Chitungwiza Municipality</span>
                            </div>
                        </div>
                    </div>

                    <!-- Project Info -->
                    <div>
                        <h3 class="text-xl font-semibold text-gray-700 border-b border-gray-200 pb-2 mb-4">Project Information</h3>
                        <div class="space-y-3">
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Project Name</span>
                                <span class="font-semibold">Provision of Insurance Services</span>
                            </div>
                            <div class="flex items-center justify-between pb-2">
                                <span class="text-gray-600 font-medium">Description</span>
                                <span class="font-semibold">Provision for Insurance Services</span>
                            </div>
                        </div>
                    </div>

                    <!-- Line Items -->
                    <div>
                        <h3 class="text-xl font-semibold text-gray-700 border-b border-gray-200 pb-2 mb-4">Line Item Details</h3>
                        <div class="space-y-3">
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Item No.</span>
                                <span class="font-semibold">1</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">UNSPSC</span>
                                <span class="font-semibold">84131500</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Lot Name</span>
                                <span class="font-semibold">Insurance services for structures</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Lot Description</span>
                                <span class="font-semibold">Insurance services</span>
                            </div>
                            <div class="flex items-center justify-between border-b pb-2">
                                <span class="text-gray-600 font-medium">Quantity</span>
                                <span class="font-semibold">1</span>
                            </div>
                            <div class="flex items-center justify-between pb-2">
                                <span class="text-gray-600 font-medium">Unit of Measure</span>
                                <span class="font-semibold">Lump Sum</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Summary Card (1/3 Section) -->
            <div class="bg-white shadow-md rounded-md p-6 lg:col-span-1 self-start">
                <h2 class="text-xl font-semibold text-gray-800 mb-4">Tender Summary</h2>
                <ul class="space-y-2">
                    <li><strong>Tender Id:</strong> 2332</li>
                    <li><strong>Status:</strong> Published</li>
                    <li><strong>Bid Validity:</strong> 60 Days</li>
                    <li><strong>Procurement Method:</strong> Competitive Bidding</li>
                    <li><strong>Location:</strong> Chitungwiza Municipality</li>
                    <li><strong>Delivery Period:</strong> 3 Years</li>
                    <li><strong>Published Date:</strong> 18-Nov-2024</li>
                    <li><strong>Closing Date:</strong> 13-Dec-2024</li>
                </ul>
                <button class="mt-4 w-full bg-teal-800 text-white py-2 px-4 rounded hover:bg-green-800">
                    View Full Details
                </button>
            </div>
        </div>

        <!-- Timeline Section -->
        <div class="mt-6">
            @template.components.activitytimeline()
        </div>
    </div>

    <!-- Modal -->
    <div id="bidModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
        <div class="min-h-screen flex items-center justify-center">
            <div class="max-w-4xl w-full space-y-8 p-8 bg-white rounded-lg shadow-md">
                <div>
                    <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
                        Submit Tender Bid
                    </h2>
                    <p class="mt-2 text-center text-sm text-gray-600">
                        Complete the form below to submit your bid.
                    </p>
                </div>

                <form class="mt-8 space-y-6" action="/submit-bid" method="POST" enctype="multipart/form-data">
                    <div class="space-y-4">
                        <!-- Bidder Name -->
                        <div>
                            <input name="bidderName" type="text" required
                                   class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                   placeholder="Bidder Name"
                            >
                        </div>

                        <!-- Company Name -->
                        <div>
                            <input name="companyName" type="text" required
                                   class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                   placeholder="Company Name"
                            >
                        </div>

                        <!-- Bid Amount -->
                        <div>
                            <input name="bidAmount" type="number" required
                                   class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                   placeholder="Bid Amount (USD)"
                            >
                        </div>

                        <!-- Bid Document Upload -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="bidDocument">Upload Bid Document</label>
                            <input name="bidDocument" type="file" required
                                   class="mt-2 block w-full text-sm text-gray-500 border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                            >
                        </div>

                        <!-- Additional Notes -->
                        <div>
                        <textarea name="notes" rows="4"
                                  class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                                  placeholder="Additional Notes"></textarea>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="flex justify-end space-x-4">
                        <button type="button" id="cancelBid" class="bg-gray-300 text-gray-800 px-4 py-2 rounded-md hover:bg-gray-400">
                            Cancel
                        </button>
                        <button type="submit" class="bg-teal-800 text-white px-4 py-2 rounded-md hover:bg-green-800">
                            Submit Bid
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        const bidButton = document.getElementById('bidButton');
        const bidModal = document.getElementById('bidModal');
        const cancelBid = document.getElementById('cancelBid');
        const body = document.body;

        // Show modal
        bidButton.addEventListener('click', () => {
            bidModal.classList.remove('hidden');
            body.classList.add('modal-open');
        });

        // Hide modal
        cancelBid.addEventListener('click', () => {
            bidModal.classList.add('hidden');
            body.classList.remove('modal-open');
        });

        // Close modal when clicking outside the content
        bidModal.addEventListener('click', (event) => {
            if (event.target === bidModal) {
                bidModal.classList.add('hidden');
                body.classList.remove('modal-open');
            }
        });
    </script>
`, email = email, csrfHiddenInput = csrfHiddenInput)