<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.TheaterModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete Theater</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>TheaterModels</legend>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Name) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Name) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Adress) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Adress) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.State) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.State) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Zip) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.Zip) %>
        </div>

        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Phones) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Phones) %>
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
    <% using (Html.BeginForm())
       { %>
    <p>
        <input type="submit" value="Delete" />
        |
        <%: Html.ActionLink("Back to Theater Information Management", "Theaters") %>
    </p>
    <% } %>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
