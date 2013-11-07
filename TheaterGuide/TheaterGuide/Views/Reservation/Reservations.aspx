<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.ReservationModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reservation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Reservation Management</h2>

    <% using (Html.BeginForm("Reservations", "Reservation", FormMethod.Get)) { %>
    <p> Status: 
        <%: Html.DropDownList("status", new List<SelectListItem> (new [] {
                    new SelectListItem { Text = "Cancelled", Value = "C" },
                    new SelectListItem { Text = "Valid", Value = "V"}}), "All")%>
    </p>
    <p> Reservation Id: 
        <%: Html.TextBox("id") %>
    </p>
    <input type="submit" value="Search" />
<% } %>

<table>
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.ReserveId) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.MovieId) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.NumberOfSeats) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.TotalPaied) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.SubmitDate) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.SubmitTime) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Status) %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.ReserveId) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.MovieId) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.NumberOfSeats) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TotalPaied) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.SubmitDate) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.SubmitTime) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Status) %>
        </td>
        <td>
            <%: Html.ActionLink("Cancel", "Cancel", new { id=item.ReserveId }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.ReserveId }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.ReserveId }) %>
        </td>
    </tr>
<% } %>

</table>
    <br/>
    <%: Html.ActionLink("Back to Site Management", "SiteMgmt", "Account") %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
