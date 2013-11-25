<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.ReservationModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ReservationHistory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Reservation History</h2>
<table class="table table-striped" style="margin-top:20px">
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.ReserveId) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.ShowId) %>
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
            <%: Html.DisplayFor(modelItem => item.ShowId) %>
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
            <% if(item.Status.Equals("V")) { %>
                Reserved
            <%} else {%>
                Cancelled
            <%} %>
        </td>
        <td>
            <%if(item.Status.Equals("V") && (item.Date.CompareTo(DateTime.Now) > 0)) {%>
            <%: Html.ActionLink("Cancel", "Cancel", new { id=item.ReserveId }) %> |
            <%} %>
            <%: Html.ActionLink("Details", "Details", new { id=item.ReserveId }) %> 
        </td>
    </tr>
<% } %>

</table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
