<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.MovieModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Movie Details</h2>

<fieldset>
    <legend></legend>

    <div class="col-sm-2">
        <%: Html.DisplayNameFor(model => model.Name) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Name) %>
    </div>

    <div class="col-sm-2">
        <%: Html.DisplayNameFor(model => model.Director) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Director) %>
    </div>

    <div class="col-sm-2">
        <%: Html.DisplayNameFor(model => model.Description) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Description) %>
    </div>
    <div class="col-sm-2">
        <%: Html.DisplayNameFor(model => model.ReleaseDate) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ReleaseDate) %>
    </div>

    <div class="col-sm-2">
        <%: Html.DisplayNameFor(model => model.RunTime) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.RunTime) %>
    </div>
    <div class="col-sm-2">
        <%: Html.DisplayNameFor(model => model.Rating) %>
    </div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Rating) %>
    </div>
</fieldset>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
