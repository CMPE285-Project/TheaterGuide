<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<TheaterGuide.Models.ShowModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create Show</h2>

    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend></legend>

        <div class="col-sm-2">
            <label>Choose Theater</label>
        </div>
        <div style="padding-left: 100px">
            <%: Html.DropDownListFor(model => model.TheaterId, (List<SelectListItem>)ViewBag.TheaterLst, "select one")%>
            <%: Html.ValidationMessageFor(model => model.TheaterId) %>
        </div>
        <br />

        <div class="col-sm-2">
            <label>Choose Movie</label>
        </div>
        <div style="padding-left: 100px">
            <%: Html.DropDownListFor(model => model.MovieId, (List<SelectListItem>)ViewBag.MovieLst, "select one") %>
            <%: Html.ValidationMessageFor(model => model.MovieId) %>
        </div>
        <br />

        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Price) %>
        </div>
        <div style="padding-left: 100px">
            <%: Html.EditorFor(model => model.Price)%>
            <%: Html.ValidationMessageFor(model => model.Price) %>
        </div>
        <br />

        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.BeginTime) %>
        </div>
        <div style="padding-left: 100px">
            <%: Html.EditorFor(model => model.BeginTime) %>
            <%: Html.ValidationMessageFor(model => model.BeginTime) %>
        </div>
        <br />

        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Date) %>
        </div>
        <div style="padding-left: 100px">
            <%: Html.EditorFor(model => model.Date) %>
            <%: Html.ValidationMessageFor(model => model.Date) %>
        </div>
        <br />
        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.AvailableSeat) %>
        </div>
        <div style="padding-left: 100px">
            <%: Html.EditorFor(model => model.AvailableSeat) %>
            <%: Html.ValidationMessageFor(model => model.AvailableSeat) %>
        </div>
        <br />

        <div class="col-sm-2">
            <%: Html.LabelFor(model => model.Discount) %>
        </div>
        <div style="padding-left: 100px">
            <%: Html.EditorFor(model => model.Discount) %>
            <%: Html.ValidationMessageFor(model => model.Discount) %>
        </div>
        <br />
        <div class="col-sm-2">
            <input type="submit" value="Create" />
        </div>
    </fieldset>
    <% } %>
    <br />
    <div>
        <%: Html.ActionLink("Back to Show Information Management", "Shows") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
    <%: Scripts.Render("~/bundles/jqueryval") %>
</asp:Content>
