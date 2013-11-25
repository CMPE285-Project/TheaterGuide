
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h2>Thank you for your reservation on Theater Guide.</h2>
    <hr />
    <h4>Your Reservation detail: </h4>

    <label style="width:120px">Reserve ID:</label>
    <%= ViewBag.Data.ReserveId %><br />

    <label style="width:120px">Movie:</label>
    <%= ViewBag.Data.MovieName %><br />

    <label style="width:120px">Theater:</label>
    <%= ViewBag.Data.TheaterName %><br />

    <label style="width:120px">Number Of Seats:</label>
    <%= ViewBag.Data.NumberOfSeats %><br />

    <label style="width:120px">Total Price:</label>
    <%= ViewBag.Data.TotalPaied %><br />

    <label style="width:120px">Date:</label>
    <%= ViewBag.Data.Date.ToString("MMMM dd, yyyy") %><br />

    <label style="width:120px">Begin Time:</label>
    <%= ViewBag.Data.BeginTime %><br />

    <label style="width:120px">Address:</label>
    <%= ViewBag.Data.Address%>
</asp:Content>
