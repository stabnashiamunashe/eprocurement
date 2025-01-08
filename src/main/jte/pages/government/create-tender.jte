@import tech.stabnashiamunashe.eprocurement.Models.*
@import tech.stabnashiamunashe.eprocurement.Models.FundingSource
@import tech.stabnashiamunashe.eprocurement.Models.LotType
@import tech.stabnashiamunashe.eprocurement.Security.CsrfHiddenInput
@import java.util.List

@param List<LotType> lotTypeList = java.util.List.of(tech.stabnashiamunashe.eprocurement.Models.LotType.values())
@param List<ClassOfProcurement> classesOfProcurement = java.util.List.of(tech.stabnashiamunashe.eprocurement.Models.ClassOfProcurement.values())
@param List<FundingSource> fundingSources = java.util.List.of(tech.stabnashiamunashe.eprocurement.Models.FundingSource.values())
@param List<ProcurementMethod> procurementMethods = java.util.List.of(tech.stabnashiamunashe.eprocurement.Models.ProcurementMethod.values())


@param CsrfHiddenInput csrfHiddenInput
@param String email
@param Boolean error = null
@param String message = null


@template.layout.maindashboard(content = @`
    <div class="flex min-h-screen">
        <div class="flex-1">
            <header class="bg-white shadow-md p-4">
                <h1 class="text-lg font-semibold">Create New Tender</h1>
            </header>
            <main class="py-6">
                <form action="/tenders/save" method="POST" enctype="multipart/form-data"
                      class="bg-white shadow rounded-md p-6 space-y-6">
                    ${csrfHiddenInput}

                    <!-- Feedback Messages -->
                    @if(error != null)
                        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                            <strong class="font-bold">Error!</strong>
                            <span class="block sm:inline">${message}</span>
                        </div>
                    @endif

                    @if(message != null)
                        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
                            <strong class="font-bold">Success!</strong>
                            <span class="block sm:inline">${message}</span>
                            <div class="mt-4 flex space-x-4">
                                <a href="/tenders/1"
                                   class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                                    View Tender
                                </a>
                                <button
                                        class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                                    Cancel
                                </button>
                            </div>
                        </div>
                    @endif

                    <!-- General Information -->
                    <div>
                        <label for="title" class="block text-sm font-medium text-gray-700">Tender Title</label>
                        <input type="text" id="title" name="title" required
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 h-12">
                    </div>
                    <div>
                        <label for="description" class="block text-sm font-medium text-gray-700">Tender Description</label>
                        <textarea id="description" name="description" rows="6" required
                                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"></textarea>
                    </div>

                    <!-- Dates -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                        <div>
                            <label for="releaseDate" class="block text-sm font-medium text-gray-700">Release Date</label>
                            <input type="date" id="releaseDate" name="releaseDate" required
                                   class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 h-12">
                        </div>
                        <div>
                            <label for="closingDate" class="block text-sm font-medium text-gray-700">Closing Date</label>
                            <input type="date" id="closingDate" name="closingDate" required
                                   class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 h-12">
                        </div>
                    </div>

                    <!-- Lot Type -->
                    <div>
                        <label for="lotType" class="block text-sm font-medium text-gray-700">Lot Type</label>
                        <select id="lotType" name="lotType" required
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                            @for(LotType lotType : lotTypeList)
                                <option value="${lotType}">${lotType.getDisplayName()}</option>
                            @endfor
                        </select>
                    </div>

                    <!-- Procurement Method -->
                    <div>
                        <label for="procurementMethod" class="block text-sm font-medium text-gray-700">Procurement Method</label>
                        <select id="procurementMethod" name="procurementMethod" required
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                            @for(ProcurementMethod procurementMethod : procurementMethods)
                                <option value="${procurementMethod}">${procurementMethod.getDisplayName()}</option>
                            @endfor
                        </select>
                    </div>

                    <!-- Class of Procurement -->
                    <div>
                        <label for="classOfProcurement" class="block text-sm font-medium text-gray-700">Class of Procurement</label>
                        <select id="classOfProcurement" name="classOfProcurement" required
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                            @for(ClassOfProcurement classOfProcurement : classesOfProcurement)
                                <option value="${classOfProcurement}">${classOfProcurement.getDisplayName()}</option>
                            @endfor
                        </select>
                    </div>

                    <!-- Funding Source -->
                    <div>
                        <label for="fundingSource" class="block text-sm font-medium text-gray-700">Funding Source</label>
                        <select id="fundingSource" name="fundingSource" required
                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                            @for(FundingSource fundingSource : fundingSources)
                                <option value="${fundingSource}">${fundingSource.getDisplayName()}</option>
                            @endfor
                        </select>
                    </div>

                    <!-- Location -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Location</label>
                        <div id="map" class="w-full h-96 rounded-md border border-gray-300"></div> <!-- Increased height to h-96 -->
                        <input type="hidden" id="location.latitude" name="location.latitude">
                        <input type="hidden" id="location.longitude" name="location.longitude">
                        <p class="text-sm text-gray-500 mt-2">Click on the map to select a location. Latitude and longitude will be automatically filled.</p>
                    </div>


                    <!-- Line Items -->
<%--                    <div>--%>
<%--                        <label for="lineItems" class="block text-sm font-medium text-gray-700">Line Items</label>--%>
<%--                        <textarea id="lineItems" name="lineItems" rows="4" placeholder="Enter line items, one per line" required--%>
<%--                                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"></textarea>--%>
<%--                    </div>--%>

                    <!-- File Upload -->
                    <div>
                        <label for="documents" class="block text-sm font-medium text-gray-700">Upload Documents</label>
                        <input type="file" id="documents" name="documents" required multiple
                               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                               onchange="handleFileChange(event)">
                        <ul id="file-list" class="mt-1 border border-gray-300 rounded-md p-2"></ul>
                    </div>

                    <!-- Submit Button -->
                    <div class="flex justify-end">
                        <button type="submit"
                                class="bg-teal-800 text-white px-6 py-2 rounded-md hover:bg-green-800">
                            Save Tender
                        </button>
                    </div>
                </form>
            </main>
        </div>
    </div>


    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"></script>
    <script>
        function handleFileChange(event) {
            const fileList = event.target.files;
            const fileDropzone = document.getElementById('file-dropzone');
            const fileListElement = document.getElementById('file-list');

            // Clear existing files
            fileListElement.innerHTML = '';

            // Add new files
            for (let i = 0; i < fileList.length; i++) {
                const file = fileList[i];
                const listItem = document.createElement('li');
                listItem.textContent = file.name;
                fileListElement.appendChild(listItem);
            }
        }

        const map = L.map('map').setView([-17.8252, 31.0335], 13); // Latitude and longitude of Harare, zoom level 13

        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 18,
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        let marker;

        // Add click event to map
        map.on('click', function (e) {
            const { lat, lng } = e.latlng;

            // Update hidden input fields
            document.getElementById('location.latitude').value = lat;
            document.getElementById('location.longitude').value = lng;

            // Update marker position
            if (marker) {
                marker.setLatLng(e.latlng);
            } else {
                marker = L.marker(e.latlng).addTo(map);
            }
        });

    </script>

`, csrfHiddenInput = csrfHiddenInput, email = email)