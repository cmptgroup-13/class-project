//index below
var slides = document.querySelectorAll('#slides .slide');
var currentSlide = 0;
var slideInterval = setInterval(nextSlide,2000);
function nextSlide(){
	slides[currentSlide].className = 'slide';
	currentSlide = (currentSlide+1)%slides.length;
	slides[currentSlide].className = 'slide showing';
}

//showsingle below
  myLatLng = new google.maps.LatLng({lat: <%= @bath.latitude %>, lng: <%= @bath.longitude %>});

handler = Gmaps.build('Google');
handler.buildMap({ provider: {zoom: 16, center: myLatLng}, internal: {id: 'map'}}, function(){
  markers = handler.addMarkers([
      {
          "lat": <%= @bath.latitude %>,
          "lng": <%= @bath.longitude %>,
          "picture": {
                    "url": "http://megaicons.net/static/img/icons_sizes/105/244/32/toilet-paper-icon.png",
                     "width":  32,
                     "height": 32

          },
          "infowindow": "hello!"
      }
      ]);



  handler.bounds.extendWith(markers);
  //handler.fitMapToBounds();
});
