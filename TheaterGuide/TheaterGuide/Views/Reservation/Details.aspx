<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ReservationModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend></legend>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.ReserveId) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ReserveId) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.MovieName) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.MovieName) %>
    </div>
    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.TheaterName) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TheaterName) %>
    </div>
    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Address) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Address) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.NumberOfSeats) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NumberOfSeats) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.TotalPaied) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TotalPaied) %>
    </div>
    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Email) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Email) %>
    </div>
    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.SubmitDate) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.SubmitDate) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.SubmitTime) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.SubmitTime) %>
    </div>

    <div class="display-label">
        <%: Html.DisplayNameFor(model => model.Status) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Status) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Cancel", "Cancel", new { id=Model.ReserveId }) %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
