<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About - Theater Guide
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <hgroup class="title">
        <h1>About.</h1>
        
    </hgroup>
    <div class="aboutcenter">
   
        <p>
            This system is focus on seaching moving or theater.
        </p>
           <p>
            There are different role to login to complete manage the whole sysytem.
        </p>
       <p>
            The customer can search theater by theater name .
         </p>
        

        <p>
            The address of the theater will clearly display on map.
        </p>
       <p>
            The customer can make a reservation on this website.
        </p>
        <p>
            This system offers account mangement where you can view or edit reserved movies.
        </p>

        
       <p>
            Once you make a reservation ,the system will send you a confirm letter by email.
         </p><br>
       <p><b>
            Team member: Xun Lan , Zhang Chi , Xueyin Wang , Shuang Liu.
           </b>
         </p>
    
        </div>
        
    <aside>
        <div class="center">
        <h3 >Quick Link</h3>
        
            <p><%: Html.ActionLink("Home", "Index", "Home") %></p>
            <p><%: Html.ActionLink("About", "About", "Home") %></p>
            <p><%: Html.ActionLink("Contact", "Contact", "Home") %></p>
        
        </div>
    </aside>
        
</asp:Content>