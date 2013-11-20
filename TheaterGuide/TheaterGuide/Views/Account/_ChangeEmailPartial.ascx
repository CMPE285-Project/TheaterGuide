<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<TheaterGuide.Models.UserProfile>" %>

<h3>Change Email Address</h3>

<% using (Html.BeginForm("ChangeEmail", "Account")) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary() %>

    <fieldset>
        <legend></legend>
        <form role="form">
            <div class="form-group">
                <label>Current email address</label><br />
                <%: Html.DisplayFor(m => m.Email) %>
            </div>
            <div class="form-group">
                <%: Html.HiddenFor(model => model.UserId) %>
                <%: Html.HiddenFor(model => model.UserName) %>
                <%: Html.HiddenFor(model => model.UserType) %>
                <label>New email address</label><br />
                <%: Html.EditorFor(model => model.Email) %>
                <%: Html.ValidationMessageFor(model => model.Email) %>
            </div>
        </form>
        <input type="submit" value="Save" />
    </fieldset>
<% } %>
