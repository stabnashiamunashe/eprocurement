@import java.util.List
@param List<String> projects

@template.layout.vendordashboard(content = @`
    <div class="bg-white shadow rounded-lg p-6">
        <h1 class="text-2xl font-bold mb-4">Our Projects</h1>
        <ul class="list-disc list-inside">
            @for(String project : projects)
                <li class="text-gray-600">${project}</li>
            @endfor
        </ul>
    </div>
`)