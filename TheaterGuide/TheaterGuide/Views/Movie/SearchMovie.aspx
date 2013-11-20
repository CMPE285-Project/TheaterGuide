<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.MovieModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Movie
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Search Movie</h2>
    <% using (Html.BeginForm())
       { %>
     Movie Name: 
        <%: Html.TextBox("SearchString") %>
    
    <input type="submit" value="Search" />
<% } %>

<table class="table table-striped" style="margin-top:20px">
    <tr>       
        <th>
            <%: Html.DisplayNameFor(model => model.Name) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.Director) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.ReleaseDate) %>
        </th>
        <th>
            <%: Html.DisplayNameFor(model => model.RunTime) %>
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
            <%: Html.DisplayFor(modelItem => item.Director) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ReleaseDate) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.RunTime) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Rating) %>
        </td>
        <td>
            <%: Html.ActionLink("Details", "Details", new { id=item.MovieId }) %> |
            <%: Html.ActionLink("Movie Shows",  "SearchResult", "Show", new { theaterId=0, searchString=String.Empty, movieId=item.MovieId }, null) %>
        </td>
    </tr>
<% } %>

</table>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
