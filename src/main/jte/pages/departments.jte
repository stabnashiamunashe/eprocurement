@import tech.stabnashiamunashe.eprocurement.Models.GovernmentMinistry
@import java.util.List
@param List<GovernmentMinistry> governmentMinistries

@template.layout.main(content = @`
    <div>
        <h1 class="text-2xl font-bold text-gray-800 mb-4">Departments</h1>
        <ul>

            @for(GovernmentMinistry ministry : governmentMinistries)
                <li  class="mb-2">
                    <h2 class="text-lg font-semibold text-gray-800" >${ministry.getName()}</h2>
                    <p class="text-gray-600">${ministry.getDescription()}</p>
                </li>
            @endfor
        </ul>
    </div>
    @template.components.metrics-cards( )
`)