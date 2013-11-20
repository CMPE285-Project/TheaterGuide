<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ShowModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend></legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.MovieId) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.MovieId) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.TheaterId) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TheaterId) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Price) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Price) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.BeginTime) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.BeginTime) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Date) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Date) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.AvailableSeat) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.AvailableSeat) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Discount) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Discount) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        
    <%: Html.ActionLink("Back to Show Information Management", "Shows") %>
    </p>
<% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
