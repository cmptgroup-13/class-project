// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require jquery.raty.js
//= require_tree .

var Geolocation = {
  rad: function(x) { return x * Math.PI / 180 },
  
  // Distance in kilometers between two points using the Haversine algo.
  haversine: function(p1, p2) {
    var R = 6371 // Earth's mean radius in km.
    var dLat  = this.rad(p2.latitude - p1.latitude)
    var dLong = this.rad(p2.longitude - p1.longitude)

    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.cos(this.rad(p1.latitude)) * Math.cos(this.rad(p2.latitude)) * Math.sin(dLong/2) * Math.sin(dLong/2)
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    var d = R * c

    return Math.round(d)
  },
  
  // Distance between me and the passed position.
  distance_from: function(position) {
    Geolocation.display_location()
    var distance = Geolocation.haversine(position.coords, current_location)

    if ( distance && distance > 0 ) $("#distance").text(distance + " km")
    else $("#user_distance").html("<strong>You're close!</strong> Watch my toes!")
  },
  
  // Hide spinner and show location.
  display_location: function() {
    $("#user_distance").show()
    $("#geolocating").hide()
  }
}

$(function() {
  
  // Geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(Geolocation.distance_from, Geolocation.display_location)
    navigator.geolocation.watchPosition(Geolocation.distance_from)
  } else {
    Geolocation.display_location()
  }
  
  function slide_down_location() {
    $("#map").slideDown()
    $(this).unbind('mouseover')
  }
  
  $("#location").mouseover(slide_down_location)
  
  $("#location_hide").click(function() {
    $("#map").slideUp()
    $("#location").mouseover(slide_down_location)
    return false
  })
  
  var fixed = false

  $(document).scroll(function() {
    if( $(this).scrollTop() >= 75 ) {
      if( !fixed ) {
        fixed = true
        $('#side').css({position: 'fixed', top: "25px"})
      }                                          
    } else {
      if( fixed ) {
        fixed = false
        $('#side').css({position:'absolute', top: "100px"})
      }
    }
  })
  
})


function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}


