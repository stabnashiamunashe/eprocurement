<%--@import tech.stabnashiamunashe.eprocurement.Models.Tender--%>
<%--@import java.util.List--%>
<%--@param List<Tender> tenders--%>
<%--@param int totalPages--%>
<%--@param int currentPage--%>
<%--@param int pageSize = 10--%>
<%--@param final int i = 0--%>


@template.layout.vendordashboard(content = @`
    @template.components.tenders()
`)