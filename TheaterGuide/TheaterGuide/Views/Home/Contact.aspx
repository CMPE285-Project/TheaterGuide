<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="contactTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Contact - Theater Guide
</asp:Content>

<asp:Content ID="contactContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="center">
    <hgroup class="title">
        <h1>Contact</h1>
        
    </hgroup>
    <section class="contact information">
        <header>
            Phone:
        </header>
        <p>
            <span>888-888-8888</span>
        </p>
    </section>

    <section class="contact information" >
        <header>
           Email:
        </header>
        <p>
            <span><a href="mailto:theater_guide@example.com">theater_guide@example.com</a></span>
        </p>
    </section>

    <section class="contact information">
        <header>
            Address:
        </header>
        <p>One Washington Square<br />
            San Jose, CA 95192
        </p>
    </section>
        </div>
</asp:Content>