@param String successMessage
@param String errorMessage


@if(errorMessage != null)

    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
        <strong class="font-bold">Success!</strong>
        <span class="block sm:inline">${successMessage}</span>
    </div>
@endif

@if(successMessage != null)
    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
        <strong class="font-bold">Error!</strong>
        <span class="block sm:inline">${errorMessage}</span>
    </div>
@endif



