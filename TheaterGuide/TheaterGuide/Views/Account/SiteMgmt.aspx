<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.UserProfile>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Site Management
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Site Information Management</h2>
    <div style="float:left; margin-right:100px">
        <ul style="font-size:medium">
            <li><%: Html.ActionLink("Theater", "Theaters", "Theater") %></li>
            <li><%: Html.ActionLink("Movie", "Movies", "Movie") %></li>
            <li><%: Html.ActionLink("Show", "Shows", "Show") %></li>
            <li><%: Html.ActionLink("Reservation", "Reservations", "Reservation") %></li>
        </ul>
    </div>

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
