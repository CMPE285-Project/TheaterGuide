<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ReservationModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Cancel
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Cancel Reservation</h2>
    <h3>Are you sure you want to cancel this?</h3>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ReserveId) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.ReserveId) %>
            <%: Html.HiddenFor(model => model.ReserveId) %>
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
        <div class="editor-label">
            <%: Html.LabelFor(model => model.SubmitDate) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.SubmitDate) %>
            <%: Html.HiddenFor(model => model.SubmitDate) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.SubmitTime) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.SubmitTime) %>
            <%: Html.HiddenFor(model => model.SubmitTime) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Status) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.Status) %>
            <%: Html.HiddenFor(model => model.Status) %>
        </div>

        <p>
            <input type="submit" value="Confirm to Cancel" />
        </p>
    </fieldset>
    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "ReservationHistory") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
