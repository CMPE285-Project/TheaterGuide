<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.MovieModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Movie
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="functionPicture">
<h2>Search Movie</h2>
    <% using (Html.BeginForm())
       { %>
     Movie Name: 
        <%: Html.TextBox("SearchString") %>
    
    <input type="submit" value="Search" />
<% } %>
</div>
<% foreach (var item in Model) { %>
    <img src="http://placehold.it/100x150" class="functionPicture" />
    <div class="functionDescription">
       <p>Name: <%: item.Name %></p>
       <p>Rating: <%: item.Rating %></p>
       <p>Description: <%: item.Description %></p>
       <p>Director: <%: item.Director %></p>
       <%: Html.ActionLink("Go to Reserve",  "SearchResult", "Show", new { theaterId=0, searchString=String.Empty, movieId=item.MovieId }, null) %>
    </div>
<% } %>
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
