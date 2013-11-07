<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.UserProfile>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Account
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Account Management</h2>
    <p>You're logged in as <strong><%: User.Identity.Name %></strong>.</p>
    <p class="message-success"><%: (string)ViewBag.StatusMessage %></p>

    <div id="menu" style="float:left; margin-right:100px">
        <ul style="font-size:medium">
            <li><%: Ajax.ActionLink("Change Email Address", "ChangeEmail", "Account", new AjaxOptions { UpdateTargetId = "right" } ) %></li>
            <li><%: Ajax.ActionLink("Change Password", "ChangePassword", "Account", new AjaxOptions { UpdateTargetId = "right" } ) %></li>
            <li><%: Ajax.ActionLink("Reserve History", "ReservationHistory", "Reservation", new AjaxOptions { UpdateTargetId = "right" } ) %></li>
        </ul>
    </div>

    <div id="right">
                    <%: Html.LabelFor(m => m.Email) %>
                    <%: Html.DisplayFor(m => m.Email) %>
    </div>

</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jquery") %>
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
