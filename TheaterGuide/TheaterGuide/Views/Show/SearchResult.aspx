<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.SearchViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Result
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Search Result</h2>

    <table class="table table-bordered" style="margin-top:20px">
        <tr>
            <th class="col-sm-2">
            </th>
            <th class="col-sm-8">
                Information
            </th>
            <th>
                Action
            </th>
        </tr>

        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <img src="http://placehold.it/50x50" />
                <br />
                <%: Html.DisplayFor(modelItem => item.TheaterName) %>
            </td>
            <td>
                Movie Name: <%: Html.DisplayFor(modelItem => item.MovieName) %>
 
                Address: <%: Html.DisplayFor(modelItem => item.Address) %>
                <br />
                Price: <%: Html.DisplayFor(modelItem => item.Price) %>

                Begin Time: <%: Html.DisplayFor(modelItem => item.BeginTime) %>
                <br />
                Begin Date: <%: Html.DisplayFor(modelItem => item.Date) %>
                Available Seats: <%: Html.DisplayFor(modelItem => item.AvailableSeat) %>
                <br />
                Discount: <%: Html.DisplayFor(modelItem => item.Discount) %>
            </td>
            <td>
                <% using (Html.BeginForm("Create", "Reservation", new { id = item.ShowId }, FormMethod.Get))
                   { %>
                 Qty: 
                 <%=Html.TextBox("Seats","", new { style="width:30px" })%>          
                 <input class="button" type="submit" value="Reserve" />
                <% } %>
                 <br />
                 <a href="#">Map It</a>
            </td>
        </tr>
        <% } %>
    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
