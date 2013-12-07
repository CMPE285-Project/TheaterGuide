<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.MovieModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Add New Movie</h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend></legend>
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Name) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Name) %>
            <%: Html.ValidationMessageFor(model => model.Name) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Director) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Director) %>
            <%: Html.ValidationMessageFor(model => model.Director) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Description) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Description) %>
            <%: Html.ValidationMessageFor(model => model.Description) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.ReleaseDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ReleaseDate) %>
            <%: Html.ValidationMessageFor(model => model.ReleaseDate) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.RunTime) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.RunTime) %>
            <%: Html.ValidationMessageFor(model => model.RunTime) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Rating) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Rating) %>
            <%: Html.ValidationMessageFor(model => model.Rating) %>
        </div>

        <br />
        <div class="col-sm-2">
            <input type="submit" value="Create" />
        </div>
    </fieldset>
<% } %>
    <br />
<div>
    <%: Html.ActionLink("Back to Movie Information Management", "Movies") %>
</div>
 
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
