<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<TheaterGuide.Models.SearchViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search Result
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Search Result</h2>

    <table class="table table-bordered" style="margin-top:20px">
        <tr>
            <th class="col-sm-2">
            </th>
            <th class="col-sm-8">
                Information
            </th>
            <th>
                Action
            </th>
        </tr>

        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <img src="http://placehold.it/50x50" />
                <br />
                <%: Html.DisplayFor(modelItem => item.TheaterName) %>
            </td>
            <td>
                Movie Name: <%: Html.DisplayFor(modelItem => item.MovieName) %>
 
                Address: <%: Html.DisplayFor(modelItem => item.Address) %>
                <br />
                Price: <%: Html.DisplayFor(modelItem => item.Price) %>

                Begin Time: <%: Html.DisplayFor(modelItem => item.BeginTime) %>
                <br />
                Begin Date: <%: Html.DisplayFor(modelItem => item.Date) %>
                Available Seats: <%: Html.DisplayFor(modelItem => item.AvailableSeat) %>
                <br />
                Discount: <%: Html.DisplayFor(modelItem => item.Discount) %>
            </td>
            <td>
                <% using (Html.BeginForm("Create", "Reservation", new { id = item.ShowId }, FormMethod.Get))
                   { %>
                 Qty: 
                 <%=Html.TextBox("Seats","", new { style="width:30px" })%>          
                 <input class="button" type="submit" value="Reserve" />
                <% } %>
                 <br />
                 <a href="<%:item.Address%>,<%:item.City %>,<%:item.State %>" data-toggle="modal" data-target="#myModal" class="myMap">Map It</a>
            </td>
        </tr>
        <% } %>
    </table>
    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
            <div id="map-canvas" style="width:500px; height:500px;"></div>
            <br />
            <div id="directionsPanel"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="IndexContent" runat="server">

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
     <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var targetAddress = null;
        var rendererOptions = {
            draggable: true
        };
        var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);;
        var directionsService = new google.maps.DirectionsService();
        var map;


        function initialize() {

            var mapOptions = {
                zoom: 12
            };
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('directionsPanel'));
            calcRoute();
           
        }

        function calcRoute() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    currentLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                    var request = {
                        origin: currentLocation,
                        destination: targetAddress,
                        travelMode: google.maps.TravelMode.DRIVING
                      };
                    directionsService.route(request, function (response, status) {
                        if (status == google.maps.DirectionsStatus.OK) {
                            directionsDisplay.setDirections(response);
                        }
                    });
                });
            }
        }
        $(".myMap").click(initialize);
        $("#myModal").on("shown.bs.modal", function () {
            google.maps.event.trigger(map, "resize");
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    centerLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                    map.setCenter(centerLocation);
                    map.setZoom(10);

                });
            }
        });
        $("a").click(function () {
            targetAddress = $(this).attr('href');
        });
</script>
</asp:Content>
