<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.SearchViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Show Information Management</h2>

<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
     <% using (Html.BeginForm("Shows", "Show", FormMethod.Get))
       { %>
    
        Choose Theater: 
        <%: Html.DropDownList("id", (List<SelectListItem>)ViewBag.TheaterLst, "slectct one") %>
    
        Movie Name: 
        <%: Html.TextBox("SearchString") %>
   
    <input type="submit" value="Search" />
    <% } %>

<table class="table table-striped" style="margin-top:20px">
    <tr>
        <th>
            <%: Html.DisplayNameFor(model => model.MovieName) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.TheaterName) %>
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

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.MovieName) %>#
            <%: Html.DisplayFor(modelItem => item.MovieId) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.TheaterName) %>#
            <%: Html.DisplayFor(modelItem => item.TheaterId) %>
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
            <%: Html.ActionLink("Edit", "Edit", new { id=item.ShowId }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.ShowId }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.ShowId }) %>
        </td>
    </tr>
<% } %>

</table>
<br/>
<div>
    <%: Html.ActionLink("Back to Site Management", "SiteMgmt", "Account") %>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
