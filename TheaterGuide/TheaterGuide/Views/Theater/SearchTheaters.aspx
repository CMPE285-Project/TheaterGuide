<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.TheaterModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SearchTheaters
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Theaters Search</h2>
     <% using (Html.BeginForm())
       { %>
    <p> Theater Name: 
        <%: Html.TextBox("SearchString") %>
    </p>
    <input type="submit" value="Search" />
<% } %>

    <table>
        <tr>
            <th>
                <%: Html.DisplayNameFor(model => model.Name) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Address) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.City) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Phone) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Hours) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.PriceRange) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Rating) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.WebSite) %>
            </th>
            <th></th>
        </tr>

        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.Name) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Address) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.City) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Phone) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Hours) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.PriceRange) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Rating) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.WebSite) %>
            </td>
            <td>
                <%: Html.ActionLink("Details", "Details", new { id=item.TheaterId }) %> |
                <%: Html.ActionLink("Movie Shows",  "SearchResult", "Show", new { theaterId=item.TheaterId }, null) %>
            </td>
        </tr>
        <% } %>
    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
