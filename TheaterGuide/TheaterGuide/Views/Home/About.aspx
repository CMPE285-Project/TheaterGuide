<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About - Theater Guide
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">

    <hgroup class="title">
        <h1>About</h1>

    </hgroup>
    <div class="aboutcenter information">

        <p>
            You can seach movie or theater on this Website and make a reservation.
        </p>
        <p>
            Once you make a reservation, our system will send you a confirmation email to your registered email address.
        </p>
        <p>
            Please enjoy!
        </p><br />
        <div class="center" style="font-weight:bold">
            Team member:<br />
            Lan Xu, Chi Zhang, Xueyin Wang, Shuang Liu<br />
        </div>
    </div>

</asp:Content>
