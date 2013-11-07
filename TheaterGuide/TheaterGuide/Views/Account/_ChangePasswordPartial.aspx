﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.LocalPasswordModel>" %>

<h3>Change Password</h3>

<% using (Html.BeginForm("ChangePassword", "Account")) { %>
    <%: Html.AntiForgeryToken() %>
    <%: Html.ValidationSummary() %>

    <fieldset>
        <legend>Change Password Form</legend>
        <ol>
            <li>
                <%: Html.LabelFor(m => m.OldPassword) %>
                <%: Html.PasswordFor(m => m.OldPassword) %>
            </li>
            <li>
                <%: Html.LabelFor(m => m.NewPassword) %>
                <%: Html.PasswordFor(m => m.NewPassword) %>
            </li>
            <li>
                <%: Html.LabelFor(m => m.ConfirmPassword) %>
                <%: Html.PasswordFor(m => m.ConfirmPassword) %>
            </li>
        </ol>
        <input type="submit" value="Change password" />
    </fieldset>
<% } %>
