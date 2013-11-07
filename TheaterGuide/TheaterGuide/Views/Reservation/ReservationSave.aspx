<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ReservationModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reservation Result
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%if (ViewBag.Success == true) { %>
    <h2>Reservation Success
    </h2>
    <p>You have successfully reserved the seats. A confirmation email will send to your registered email.</p>
    <p>Your reservation number is 
        <%: Html.DisplayFor(model => model.ReserveId) %>.
    </p>
    <p>You also can find your reservation history in your <a href="/Account/AccountInfo">account</a>.
    </p>
    <%} else {%>
    <h2>Reservation Fail
    </h2>
    <p>
        Sorry, your reservation is failed due to some reason.
    </p>
    <%} %>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
