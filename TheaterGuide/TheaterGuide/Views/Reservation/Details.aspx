<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ReservationModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend></legend>

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.ReserveId) %>
    </label>
        <%: Html.DisplayFor(model => model.ReserveId) %><br />

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.MovieName) %>
    </label>
        <%: Html.DisplayFor(model => model.MovieName) %><br />

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.TheaterName) %>
    </label>
        <%: Html.DisplayFor(model => model.TheaterName) %><br />

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.Address) %>
    </label>
        <%: Html.DisplayFor(model => model.Address) %><br />

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.NumberOfSeats) %>
    </label>
        <%: Html.DisplayFor(model => model.NumberOfSeats) %><br />

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.TotalPaied) %>
    </label>
        <%: Html.DisplayFor(model => model.TotalPaied) %><br />

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.Email) %>
    </label>
        <%: Html.DisplayFor(model => model.Email) %><br />

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.SubmitDate) %>
    </label>
        <%: Html.DisplayFor(model => model.SubmitDate) %><br />

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.SubmitTime) %>
    </label>
        <%: Html.DisplayFor(model => model.SubmitTime) %><br />

    <label style="width:120px">
        <%: Html.DisplayNameFor(model => model.Status) %>
    </label>
        <%: Html.DisplayFor(model => model.Status) %><br />
</fieldset>
<p>
    <%if (Model.Status.Equals("V") && (Model.Date.CompareTo(DateTime.Now) > 0))
      {%>
    <button><%: Html.ActionLink("Cancel", "Cancel", new { id=Model.ReserveId }) %></button>
    <%} %>
</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
