<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Theater Guide
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="IndexContent" runat="server">
    <div class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <img src="../../Images/free-birds05_副本.jpg"/>
            </div>
            <div class="item">
                <img src="../../Images/enders-game-movie-wallpaper-and-poster.jpg"/>
            </div>
            <div class="item">
                <img src="../../Images/Thor 2 The Dark World Movie widescreen HD Wallpaper Image Picture Photo Backgrounds_副本.jpg"/>
            </div>
  
        </div>
    </div>
    <!-- /.carousel -->


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <img src="../../Images/movies_副本.jpg"class="functionPicture" />
    <div class="functionDescription information">
        Search function will give you the easiest access to your favorite movies! 
    </div>
    <img src="../../Images/mzl.qqkpcjgs.175x175-75_副本.jpg" class="functionPicture" />
    <div class="functionDescription information">
        Reserve your ticket online and get your e-ticket just by checking your e-mail!
    </div>
    <img src="../../Images/locate-feature_副本.png" class="functionPicture" />
    <div class="functionDescription information">
        Too trouble to find the theater on GPS? Locate it here!
    </div>
    <%:User.Identity.AuthenticationType %>
</asp:Content>
