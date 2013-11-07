<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.MovieModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Movie Details</h2>

<fieldset>
    <legend>MovieModels</legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.TheaterId) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TheaterId) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Name) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Director) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Director) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Description) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Description) %>
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
        <%: Html.DisplayNameFor(model => model.RunTime) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.RunTime) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.TotalVolume) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TotalVolume) %>
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

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Rating) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Rating) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.MovieId }) %> |
    <%: Html.ActionLink("Back to Movie Information Management", "Movies") %>
</p>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
