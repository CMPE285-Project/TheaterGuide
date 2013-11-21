<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page - Theater Guide
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
                <img src="../../Images/enders-game-movie-wallpaper-and-poster.jpg"/>
            </div>
            <div class="item">
                <img src="../../Images/enders-game-movie-wallpaper-and-poster.jpg"/>
            </div>
            <div class="item">
                <img src="../../Images/enders-game-movie-wallpaper-and-poster.jpg"/>
            </div>
  
        </div>
    </div>
    <!-- /.carousel -->


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <img src="http://placehold.it/100x150" class="functionPicture" />
    <div class="functionDescription">
        Search Description
    </div>
    <img src="http://placehold.it/100x150" class="functionPicture" />
    <div class="functionDescription">
        Reserve Description
    </div>
    <img src="http://placehold.it/100x150" class="functionPicture" />
    <div class="functionDescription">
        Location Description
    </div>

</asp:Content>
