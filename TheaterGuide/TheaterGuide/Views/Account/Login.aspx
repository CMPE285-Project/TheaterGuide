﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.LoginModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Log in
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>Log in</h1>
    </hgroup>

    <section id="loginForm">
    <h2>Use a local account to log in</h2>
    <% using (Html.BeginForm(new { ReturnUrl = ViewBag.ReturnUrl })) { %>
        <%: Html.AntiForgeryToken() %>
        <%: Html.ValidationSummary(null, new { style="color:#f00"})%>

        <fieldset>
            <legend></legend>
            <form role="form">
                <div class="form-group">
                    <%: Html.LabelFor(m => m.UserName, new { style="padding-right:20px"})%>
                    <%: Html.TextBoxFor(m => m.UserName) %>
                    <%: Html.ValidationMessageFor(m => m.UserName, null, new { style="color:#f00"}) %>
                </div>
                <div class="form-group">
                    <%: Html.LabelFor(m => m.Password, new { style="padding-right:27px"}) %>
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password, null, new { style="color:#f00"}) %>
                </div>
                <div class="checkbox">
                    <%: Html.CheckBoxFor(m => m.RememberMe) %>
                    <%: Html.LabelFor(m => m.RememberMe, new { @class = "checkbox" }) %>
                </div>
            </form>
            <input type="submit" value="Log in" />
        </fieldset>
        <br />
        <p>
            <%: Html.ActionLink("Register", "Register") %> if you don't have an account.
        </p>
    <% } %>
    </section>

</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>

