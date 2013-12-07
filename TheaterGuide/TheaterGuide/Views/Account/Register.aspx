<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="autocenter">
    <hgroup class="title">
        <h1>Register</h1>
    </hgroup>


    <% using (Html.BeginForm())
       { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(null, new { style="color:#f00"}) %>

    <fieldset>
        <legend></legend>
        <form role="form">
            <div class="form-group">
                <%: Html.LabelFor(m => m.UserName, new { style="padding-right:70px"})%>
                <%: Html.TextBoxFor(m => m.UserName) %>
            </div>
            <div class="form-group">
                <%: Html.LabelFor(m => m.Email, new { style="padding-right:47px"})%>
                <%: Html.TextBoxFor(m => m.Email) %>
            </div>
            <div class="form-group">
                <%: Html.LabelFor(m => m.Password, new { style="padding-right:77px"})%>
                <%: Html.PasswordFor(m => m.Password) %>
            </div>
            <div class="form-group">
                <%: Html.LabelFor(m => m.ConfirmPassword, new { style="padding-right:18px"})%>
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
            </div>

            <input type="submit" value="Register" />
        </form>
    </fieldset>
        <br />
        <p>
            <%: Html.ActionLink("Login", "Login") %> if you already have an account.
        </p>
    <% } %>
   </div>
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
