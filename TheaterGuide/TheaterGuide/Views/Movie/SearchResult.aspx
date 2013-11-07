<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.MovieModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Result
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Search Result</h2>

    <table>
        <tr>
            <th>
                <%: Html.DisplayNameFor(model => model.TheaterId) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Name) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Director) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Description) %>
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
                <%: Html.DisplayNameFor(model => model.RunTime) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.TotalVolume) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.AvailableSeat) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Discount) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Rating) %>
            </th>
            <th></th>
        </tr>

        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.TheaterId) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Name) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Director) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Description) %>
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
                <%: Html.DisplayFor(modelItem => item.RunTime) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.TotalVolume) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.AvailableSeat) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Discount) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Rating) %>
            </td>
            <td>
                <% using (Html.BeginForm("Create", "Reservation", new { id = item.MovieId }, FormMethod.Get))
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
