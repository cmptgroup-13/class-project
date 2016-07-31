var mapOptions =
{
  maxZoom:19,
  minZoom:2,

};

handler = Gmaps.build('Google');
handler.buildMap({ provider: mapOptions, internal: {id: 'map'}}, function(){
  markers = handler.addMarkers( <%=raw @me.to_json %>);
  markers_two = handler.addMarkers( <%=raw @hash.to_json %>);
  handler.bounds.extendWith(markers);
  handler.bounds.extendWith(markers_two);
  handler.fitMapToBounds();
});
