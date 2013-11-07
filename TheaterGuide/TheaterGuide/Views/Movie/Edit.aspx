<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.MovieModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit Movie</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>MovieModels</legend>

        <%: Html.HiddenFor(model => model.MovieId) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TheaterId) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TheaterId) %>
            <%: Html.ValidationMessageFor(model => model.TheaterId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Name) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Name) %>
            <%: Html.ValidationMessageFor(model => model.Name) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Director) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Director) %>
            <%: Html.ValidationMessageFor(model => model.Director) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Description) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Description) %>
            <%: Html.ValidationMessageFor(model => model.Description) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Price) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Price) %>
            <%: Html.ValidationMessageFor(model => model.Price) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.BeginTime) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.BeginTime) %>
            <%: Html.ValidationMessageFor(model => model.BeginTime) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Date) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Date) %>
            <%: Html.ValidationMessageFor(model => model.Date) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.RunTime) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.RunTime) %>
            <%: Html.ValidationMessageFor(model => model.RunTime) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TotalVolume) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.TotalVolume) %>
            <%: Html.ValidationMessageFor(model => model.TotalVolume) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.AvailableSeat) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.AvailableSeat) %>
            <%: Html.ValidationMessageFor(model => model.AvailableSeat) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Discount) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Discount) %>
            <%: Html.ValidationMessageFor(model => model.Discount) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Rating) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Rating) %>
            <%: Html.ValidationMessageFor(model => model.Rating) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to Movie Information Management", "Movies") %>
</div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
