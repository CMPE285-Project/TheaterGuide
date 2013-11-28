<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ReservationModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Cancel
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Cancel Reservation</h1>
    <h3>Are you sure you want to cancel this?</h3>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend></legend>

        <label style="width: 120px">
            <%: Html.LabelFor(model => model.ReserveId) %>
        </label>
        <%: Html.DisplayFor(model => model.ReserveId) %>
        <%: Html.HiddenFor(model => model.ReserveId) %>
        <%: Html.HiddenFor(model => model.UserId) %>
        <%: Html.HiddenFor(model => model.ShowId) %>
        <br />

        <label style="width: 120px">
            <%: Html.LabelFor(model => model.MovieName) %>
        </label>
        <%: Html.DisplayFor(model => model.MovieName) %>
        <%: Html.HiddenFor(model => model.MovieName) %>
        <br />
        <label style="width: 120px">
            <%: Html.LabelFor(model => model.TheaterName) %>
        </label>

        <%: Html.DisplayFor(model => model.TheaterName) %>
        <%: Html.HiddenFor(model => model.TheaterName) %>
        <br />
        <label style="width: 120px">
            <%: Html.LabelFor(model => model.Address) %>
        </label>

        <%: Html.DisplayFor(model => model.Address) %>
        <%: Html.HiddenFor(model => model.Address) %>
        <br />

        <label style="width: 120px">
            <%: Html.LabelFor(model => model.BeginTime) %>
        </label>

        <%: Html.DisplayFor(model => model.BeginTime) %>
        <%: Html.HiddenFor(model => model.BeginTime) %>
        <br />
        <label style="width: 120px">
            <%: Html.LabelFor(model => model.Date) %>
        </label>

        <%: Html.DisplayFor(model => model.Date) %>
        <%: Html.HiddenFor(model => model.Date) %>
        <br />
        <label style="width: 120px">
            <%: Html.LabelFor(model => model.NumberOfSeats) %>
        </label>

        <%: Html.DisplayFor(model => model.NumberOfSeats) %>
        <%: Html.HiddenFor(model => model.NumberOfSeats) %>
        <br />
        <label style="width: 120px">
            <%: Html.LabelFor(model => model.TotalPaied) %>
        </label>

        <%: Html.DisplayFor(model => model.TotalPaied) %>
        <%: Html.HiddenFor(model => model.TotalPaied) %>
        <br />
        <label style="width: 120px">
            <%: Html.DisplayNameFor(model => model.Date) %>
        </label>
        <%: Html.DisplayFor(model => model.Date) %><br />
        <label style="width: 120px">
            <%: Html.DisplayNameFor(model => model.BeginTime) %>
        </label>
        <%: Html.DisplayFor(model => model.BeginTime) %><br />
        <label style="width: 120px">
            <%: Html.LabelFor(model => model.Email) %>
        </label>

        <%: Html.DisplayFor(model => model.Email) %>
        <%: Html.HiddenFor(model => model.Email) %>

        <br />
        <label style="width: 120px">
            <%: Html.LabelFor(model => model.SubmitDate) %>
        </label>

        <%: Html.DisplayFor(model => model.SubmitDate) %>
        <%: Html.HiddenFor(model => model.SubmitDate) %>
        <br />
        <label style="width: 120px">
            <%: Html.LabelFor(model => model.SubmitTime) %>
        </label>

        <%: Html.DisplayFor(model => model.SubmitTime) %>
        <%: Html.HiddenFor(model => model.SubmitTime) %>

        <br />
        <label style="width: 120px">
            <%: Html.LabelFor(model => model.Status) %>
        </label>
        <% if (Model.Status.Equals("V"))
           { %>
                Reserved
            <%}
           else
           {%>
                Cancelled
            <%} %>
        <%: Html.HiddenFor(model => model.Status) %>
        <br />
        <%if (ViewBag.InvalidOperation)
          {%>
        <div style="color: #f00">You cannot cancel this reservation. (It is already cancelled or the show date has passed)</div>
        <%}
          else
          {%>
        <p>
            <input type="submit" value="Confirm to Cancel" />
        </p>
        <%} %>
    </fieldset>
    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "ReservationHistory") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
