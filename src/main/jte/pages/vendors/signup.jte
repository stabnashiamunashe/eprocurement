@import tech.stabnashiamunashe.eprocurement.Models.Vendor
@param Vendor vendor
@param Boolean error = null
@param  Boolean successful = null
@param String message = null

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendor Signup</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="flex items-center justify-center min-h-screen">
    <div class="w-full max-w-md bg-white p-6 rounded-lg shadow-lg">
        <h2 class="text-2xl font-bold text-center text-gray-800 mb-4">Vendor Signup</h2>

        @if(error !=  null)
            <div class="bg-red-100 text-red-800 p-2 rounded mb-4">
                <p >${message}</p>
            </div>
        @endif

        @if(successful != null)
            <div class="bg-green-100 text-green-800 p-2 rounded mb-4">
                <p >${message}</p>
            </div>
        @endif


        <form action="/signup" method="post" class="space-y-4">
            <!-- Vendor Name -->
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                <input type="text" name="name" id="name"
                       class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-indigo-300">
            </div>

            <!-- Email -->
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" name="email" id="email"
                       class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-indigo-300">
            </div>

            <!-- Password -->
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                <input type="password" name="password" id="password"
                       class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-indigo-300">
            </div>

            <!-- Phone -->
            <div>
                <label for="phone" class="block text-sm font-medium text-gray-700">Phone</label>
                <input type="text" name="phone" id="phone"
                       class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-indigo-300">
            </div>

            <!-- Address -->
            <div>
                <label for="address" class="block text-sm font-medium text-gray-700">Address</label>
                <input type="text" name="address" id="address"
                       class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-indigo-300">
            </div>

            <!-- Company Name -->
            <div>
                <label for="companyName" class="block text-sm font-medium text-gray-700">Company Name</label>
                <input type="text" name="companyName" id="companyName"
                       class="w-full px-4 py-2 border rounded-md focus:ring focus:ring-indigo-300">
            </div>

            <!-- Submit Button -->
            <div>
                <button type="submit" class="w-full bg-indigo-600 text-white py-2 rounded-md hover:bg-indigo-700">
                    Signup
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
