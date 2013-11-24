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
        
        <div>
            <label style="width:120px">User Name </label><%: User.Identity.Name %>
        </div>
        
        <div>
            <%: Html.HiddenFor(model => model.UserId) %>
            <%: Html.HiddenFor(model => model.ShowId) %>
        </div>

        <div>
            <%: Html.LabelFor(model => model.MovieName, new { style="width:120px" })%>
            <%: Html.DisplayFor(model => model.MovieName) %>  
            <%: Html.HiddenFor(model => model.MovieName) %>            
        </div>

        <div>
            <%: Html.LabelFor(model => model.TheaterName, new { style="width:120px" }) %>
            <%: Html.DisplayFor(model => model.TheaterName) %>  
            <%: Html.HiddenFor(model => model.TheaterName) %>            
        </div>

        <div>
            <%: Html.LabelFor(model => model.Address, new { style="width:120px" }) %>
            <%: Html.DisplayFor(model => model.Address) %>    
            <%: Html.HiddenFor(model => model.Address) %>           
        </div>

        <div>
            <%: Html.LabelFor(model => model.BeginTime, new { style="width:120px" }) %>
            <%: Html.DisplayFor(model => model.BeginTime) %> 
            <%: Html.HiddenFor(model => model.BeginTime) %>          
        </div>

        <div>
            <%: Html.LabelFor(model => model.Date, new { style="width:120px" }) %>
            <%: Html.DisplayFor(model => model.Date) %>  
            <%: Html.HiddenFor(model => model.Date) %>         
        </div>

        <div>
            <%: Html.LabelFor(model => model.NumberOfSeats, new { style="width:120px" }) %>
            <%: Html.DisplayFor(model => model.NumberOfSeats) %>
            <%: Html.HiddenFor(model => model.NumberOfSeats) %>
        </div>

        <div>
            <%: Html.LabelFor(model => model.TotalPaied, new { style="width:120px" }) %>
            <%: Html.DisplayFor(model => model.TotalPaied) %>
            <%: Html.HiddenFor(model => model.TotalPaied) %>
        </div>        

        <div>
            <%: Html.LabelFor(model => model.Email, new { style="width:120px" }) %>
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
