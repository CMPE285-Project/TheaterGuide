<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<TheaterGuide.Models.UserProfile>" %>

<h3>Change Email Address</h3>

<% using (Html.BeginForm("ChangeEmail", "Account")) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary() %>

    <fieldset>
        <legend>Change Email Address</legend>
        <ol>
            <li>
                <label>Current email address</label>
                <%: Html.DisplayFor(m => m.Email) %>
            </li>
            <li> 
                <%: Html.HiddenFor(model => model.UserId) %>
                <%: Html.HiddenFor(model => model.UserName) %>
                <%: Html.HiddenFor(model => model.UserType) %>
                <label>New email address</label>
                <%: Html.EditorFor(model => model.Email) %>
                <%: Html.ValidationMessageFor(model => model.Email) %>
            </li>
        </ol>
        <input type="submit" value="Save" />
    </fieldset>
<% } %>
