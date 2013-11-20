<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>Register</h1>
        <h2>Create a new account</h2>
    </hgroup>

    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(null, new { style="color:#f00"}) %>

    <fieldset>
        <legend></legend>
        <form role="form">
            <div class="form-group">
                <%: Html.LabelFor(m => m.UserName) %><br/>
                <%: Html.TextBoxFor(m => m.UserName) %>
            </div>
            <div class="form-group">
                <%: Html.LabelFor(m => m.Email) %><br/>
                <%: Html.TextBoxFor(m => m.Email) %>
            </div>
            <div class="form-group">
                <%: Html.LabelFor(m => m.Password) %><br/>
                <%: Html.PasswordFor(m => m.Password) %>
            </div>
            <div class="form-group">
                <%: Html.LabelFor(m => m.ConfirmPassword) %><br/>
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
            </div>

            <input type="submit" value="Register" />
        </form>
    </fieldset>
    <% } %>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
