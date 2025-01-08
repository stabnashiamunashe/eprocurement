@import java.util.List
@param List<String> projects

@template.layout.vendordashboard(content = @`
    <div class="min-h-screen flex items-center justify-center">
        <div class="max-w-lg w-full space-y-8 p-8 bg-white rounded-lg shadow-md">
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
                <div>
                    <button type="submit"
                            class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Submit Bid
                    </button>
                </div>
            </form>
        </div>
    </div>

`)