<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ReservationModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reservation Result
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%if (ViewBag.Success == true)
      { %>
    <h2>Reservation Success
    </h2>
    <p>You have successfully reserved the seats. A confirmation email will send to your registered email.</p>
    <p>
        Your reservation number is 
        <%: Html.DisplayFor(model => model.ReserveId) %>.
    </p>
    <p>
        You also can find your reservation history in your <a href="/Account/AccountInfo">account</a>.
    </p>
    <%}
      else
      {%>
    <h2>Reservation Fail
    </h2>
    <p style="color:#f00">
        <%= ViewBag.Message %>
    </p>
    <%} %>
    <h4>Your Reservation: </h4>
    <label style="width:120px"><%: Html.DisplayNameFor(item => item.MovieName) %></label>
    <%: Html.DisplayFor(item => item.MovieName) %><br />

    <label style="width:120px"><%: Html.DisplayNameFor(item => item.TheaterName) %></label>
    <%: Html.DisplayFor(item => item.TheaterName) %><br />

    <label style="width:120px"><%: Html.DisplayNameFor(item => item.NumberOfSeats) %></label>
    <%: Html.DisplayFor(item => item.NumberOfSeats) %><br />

    <label style="width:120px"><%: Html.DisplayNameFor(item => item.TotalPaied) %></label>
    <%: Html.DisplayFor(item => item.TotalPaied) %><br />

    <label style="width:120px"><%: Html.DisplayNameFor(item => item.Date) %></label>
    <%= Model.SubmitDate.ToString("MMMM dd, yyyy") %><br />

    <label style="width:120px">Address</label>
    <%: Html.DisplayFor(item => item.Address) %>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
