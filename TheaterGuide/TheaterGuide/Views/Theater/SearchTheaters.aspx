<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.TheaterModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SearchTheaters
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Theaters Search</h2>
    <div class="functionPicture">
     <% using (Html.BeginForm())
       { %>
     Theater Name: 
        <%: Html.TextBox("SearchString") %>
    
    <input type="submit" value="Search" />
<% } %> 
    </div>
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
                <%: Html.DisplayFor(modelItem => item.Name) %>
            </td>
            <td>
            
               Address: <%: Html.DisplayFor(modelItem => item.Address) %>
            
               City: <%: Html.DisplayFor(modelItem => item.City) %>
               <br />
               Phone: <%: Html.DisplayFor(modelItem => item.Phone) %>
      
               Hours: <%: Html.DisplayFor(modelItem => item.Hours) %>
               <br />
               Price: <%: Html.DisplayFor(modelItem => item.PriceRange) %>
          
               Rating: <%: Html.DisplayFor(modelItem => item.Rating) %>
               <br />
               <%: Html.DisplayFor(modelItem => item.WebSite) %>
            </td>
            <td>
                <%: Html.ActionLink("Show Movies",  "SearchResult", "Show", new { theaterId=item.TheaterId }, null) %>
            </td>
        </tr>
        <% } %>
    </table>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
