<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.MovieModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Movie
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Search Movie</h1>
    <div style="padding-top: 1em; padding-bottom: 1em; text-align: center">
        <% using (Html.BeginForm())
           { %>
        <b>Movie Name </b>
        <%: Html.TextBox("SearchString") %>

        <input type="submit" value="Search" />
        <% } %>
    </div>
    <table class="table table-bordered" style="margin-top: 20px">
        <tr>
            <th class="col-sm-2"></th>
            <th class="col-sm-8">Information
            </th>
            <th>Action
            </th>
        </tr>

        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <img src="http://placehold.it/100x150" />
                <br />
                <%: Html.DisplayFor(modelItem => item.Name) %>
            </td>
            <td>
                <b>Run Time (mins):</b> <%: item.RunTime %><br />
                <b>Release Date:</b> <%: item.ReleaseDate.ToShortDateString() %><br />
                <b>Description:</b> <%: item.Description %><br />
                <b>Director:</b> <%: item.Director %><br />
                <span class="stars"><%= item.Rating %></span>
            </td>
            <td>
                <%: Html.ActionLink("Go to Reserve",  "SearchResult", "Show", new { theaterId=0, searchString=String.Empty, movieId=item.MovieId }, null) %>
            </td>
        </tr>
        <% } %>
    </table>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
