<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ShowModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend></legend>

        <%: Html.HiddenFor(model => model.ShowId) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.MovieId) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.MovieId) %>
             <%: Html.HiddenFor(model => model.MovieId) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.TheaterId) %>
        </div>
        <div class="editor-field">
            <%: Html.DisplayFor(model => model.TheaterId) %>
             <%: Html.HiddenFor(model => model.TheaterId) %>
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

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>
<br />
<div>
 <%: Html.ActionLink("Back to Show Information Management", "Shows") %>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
