<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.SearchViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Result
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Search Result</h2>

    <table class="table table-striped" style="margin-top:20px">
        <tr>
            
            <th>
                <%: Html.DisplayNameFor(model => model.MovieName) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.TheaterName) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Address) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Price) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.BeginTime) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Date) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.AvailableSeat) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Discount) %>
            </th>
            <th></th>
        </tr>

        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.MovieName) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.TheaterName) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Address) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Price) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.BeginTime) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Date) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.AvailableSeat) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Discount) %>
            </td>
            <td>
                <% using (Html.BeginForm("Create", "Reservation", new { id = item.ShowId }, FormMethod.Get))
                   { %>
                 Qty 
                 <%: Html.TextBox("Seats")%>               
                <input type="submit" value="Reserve" />
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
