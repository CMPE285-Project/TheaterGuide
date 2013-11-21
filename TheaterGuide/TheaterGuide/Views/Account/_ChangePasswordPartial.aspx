<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.LocalPasswordModel>" %>

<h3>Change Password</h3>

<% using (Html.BeginForm("ChangePassword", "Account")) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary(null, new { style="color:#f00"}) %>

    <fieldset>
        <legend></legend>
        <form role="form">
            <div class="form-group">
                <%: Html.LabelFor(m => m.OldPassword) %><br />
                <%: Html.PasswordFor(m => m.OldPassword) %>
            </div>
            <div class="form-group">
                <%: Html.LabelFor(m => m.NewPassword) %><br />
                <%: Html.PasswordFor(m => m.NewPassword) %>
            </div>
            <div class="form-group">
                <%: Html.LabelFor(m => m.ConfirmPassword) %><br />
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
            </div>
        </form>
        <input type="submit" value="Change password" />
    </fieldset>
<% } %>
