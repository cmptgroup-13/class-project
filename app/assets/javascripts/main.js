var slides = document.querySelectorAll('#slides .slide');
var currentSlide = 0;
var slideInterval = setInterval(nextSlide,2000);

function nextSlide() {
	slides[currentSlide].className = "slide";
	currentSlide = (currentSlide+1)%slides.length;
	slides[currentSlide].className = 'slide showing';
}




//directions start

      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: {lat: -24.345, lng: 134.46}  // Australia.
        });

        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer({
          // draggable: true,
          map: map,
          panel: document.getElementById('right-panel')
        });

        displayRoute(<%= current_user.latitude %>, <%= current_user.longitude %>, <%= @bath.latitude %>, <%= @bath.longitude %>, directionsService, directionsDisplay);
        document.getElementById('mode').addEventListener('change', function() {
          displayRoute(<%= current_user.latitude %>, <%= current_user.longitude %>, <%= @bath.latitude %>, <%= @bath.longitude %>, directionsService, directionsDisplay);
        });

        // directionsDisplay.addListener('directions_changed', function() {
        //   computeTotalDistance(directionsDisplay.getDirections());
        // });

        displayRoute(<%= current_user.latitude %>, <%= current_user.longitude %>, <%= @bath.latitude %>, <%= @bath.longitude %>, directionsService,
            directionsDisplay);
      }

      function displayRoute(lat1, long1, lat2, long2, service, display) {
        var selectedMode = document.getElementById('mode').value;
        service.route({
          origin: new google.maps.LatLng(lat1,long1),
          destination: new google.maps.LatLng(lat2,long2),
          // waypoints: [{location: 'Abbotsford, BC'}, {location: 'Vancouver, BC'}],
          travelMode: google.maps.TravelMode[selectedMode],
          avoidTolls: true
        }, function(response, status) {
          if (status === google.maps.DirectionsStatus.OK) {
            display.setDirections(response);
          } else {
            alert('Could not display directions due to: ' + status);
          }
        });

      }

      function computeTotalDistance(result) {
        var total = 0;
        var myroute = result.routes[0];
        for (var i = 0; i < myroute.legs.length; i++) {
          total += myroute.legs[i].distance.value;
        }
        total = total / 1000;
        document.getElementById('total').innerHTML = total + ' km';
      }
//directions end
