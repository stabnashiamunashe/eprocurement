@import tech.stabnashiamunashe.eprocurement.Models.Tender
@import tech.stabnashiamunashe.eprocurement.Security.CsrfHiddenInput

@import java.util.List
@param CsrfHiddenInput csrfHiddenInput
@param List<Tender> tenders


@template.layout.maindashboard(content = @`
    @template.components.tenders()
`, csrfHiddenInput = csrfHiddenInput)