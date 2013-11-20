<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ReservationModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Reservation</h2>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend></legend>

        
        <div class="editor-label">
            <label>User Name: </label><%: User.Identity.Name %>
        </div>
        
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.UserId) %>
            <%: Html.HiddenFor(model => model.ShowId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.MovieName) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.MovieName) %>  
            <%: Html.HiddenFor(model => model.MovieName) %>            
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TheaterName) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.TheaterName) %>  
            <%: Html.HiddenFor(model => model.TheaterName) %>            
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Address) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.Address) %>    
            <%: Html.HiddenFor(model => model.Address) %>           
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.BeginTime) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.BeginTime) %> 
            <%: Html.HiddenFor(model => model.BeginTime) %>          
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Date) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.Date) %>  
            <%: Html.HiddenFor(model => model.Date) %>         
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NumberOfSeats) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.NumberOfSeats) %>
            <%: Html.HiddenFor(model => model.NumberOfSeats) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TotalPaied) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.TotalPaied) %>
            <%: Html.HiddenFor(model => model.TotalPaied) %>
        </div>        
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Email) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.Email) %>
            <%: Html.HiddenFor(model => model.Email) %>
        </div> 
        <p>
            <input type="submit" value="Submit Reservation" /> |

            <%: Html.ActionLink("Cancel", "Index", "Home") %>
        </p>
    </fieldset>
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
