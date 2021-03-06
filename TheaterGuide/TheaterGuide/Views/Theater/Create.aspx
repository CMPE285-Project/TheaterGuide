﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.TheaterModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Add New Theater</h2>

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
            <%: Html.LabelFor(model => model.Address) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Address) %>
            <%: Html.ValidationMessageFor(model => model.Address) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.City) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.City) %>
            <%: Html.ValidationMessageFor(model => model.City) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.State) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.State) %>
            <%: Html.ValidationMessageFor(model => model.State) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Zip) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Zip) %>
            <%: Html.ValidationMessageFor(model => model.Zip) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Phone) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Phone) %>
            <%: Html.ValidationMessageFor(model => model.Phone) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Hours) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Hours) %>
            <%: Html.ValidationMessageFor(model => model.Hours) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.PriceRange) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.PriceRange) %>
            <%: Html.ValidationMessageFor(model => model.PriceRange) %>
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
            <%: Html.LabelFor(model => model.WebSite) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.WebSite) %>
            <%: Html.ValidationMessageFor(model => model.WebSite) %>
        </div>
        <br />
        <div class="col-sm-2">
            <input type="submit" value="Create" />
        </div>
    </fieldset>
<% } %>
    <br />
<div>
    <%: Html.ActionLink("Back to Theater Information Management", "Theaters") %>
</div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
