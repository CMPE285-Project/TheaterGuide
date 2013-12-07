<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.MovieModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Movie
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Search Movie</h1>
    <div class="functionPicture">        
        <% using (Html.BeginForm())
           { %>
     Movie Name: 
        <%: Html.TextBox("SearchString") %>

        <input type="submit" value="Search" />
        <% } %>
    </div>
    <% foreach (var item in Model)
       { %>
    <img src="http://placehold.it/100x150" class="functionPicture" />
    <div class="functionDescription">
        <b>Name:</b> <%: item.Name %><br />
        <b>Run Time (mins):</b> <%: item.RunTime %><br />
        <b>Release Date:</b> <%: item.ReleaseDate.ToShortDateString() %><br />
        <b>Description:</b> <%: item.Description %><br />
        <b>Director:</b> <%: item.Director %><br />
        <span class="stars"><%= item.Rating %></span>
        <%: Html.ActionLink("Go to Reserve",  "SearchResult", "Show", new { theaterId=0, searchString=String.Empty, movieId=item.MovieId }, null) %>
    </div>
    <% } %>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
