<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.TheaterModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Theater Details</h2>

    <fieldset>
        <legend>TheaterModels</legend>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Name) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Name) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Address) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Address) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.City) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.City) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.State) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.State) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Zip) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Zip) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Phone) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Phone) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Hours) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Hours) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.PriceRange) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.PriceRange) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Rating) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Rating) %>
        </div>
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.TheaterId }) %> |
    <%: Html.ActionLink("Back to Theater Information Management", "Theaters") %>
    </p>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
