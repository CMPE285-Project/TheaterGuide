<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.TheaterModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Theater
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Theater Information Management</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>

<% using (Html.BeginForm("Theaters", "Theater", FormMethod.Get)) { %>
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
            <%: Html.DisplayNameFor(model => model.Adress) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.State) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Zip) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Phones) %>
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
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Name) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Adress) %>
        </td>
         <td>
            <%: Html.DisplayFor(modelItem => item.State) %>
        </td>
         <td>
            <%: Html.DisplayFor(modelItem => item.Zip) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Phones) %>
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
            <%: Html.ActionLink("Edit", "Edit", new { id=item.TheaterId }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.TheaterId }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.TheaterId }) %> |
            <%: Html.ActionLink("Movies", "SearchMovie", "Movie", new { searchString=String.Empty, id=item.TheaterId }, null) %>
        </td>
    </tr>
<% } %>

</table>
<br/>
<div>
    <%: Html.ActionLink("Back to Site Management", "SiteMgmt", "Account") %>
</div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
