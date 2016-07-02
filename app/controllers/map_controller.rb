class MapController < ApplicationController
  def index
    @baths = Bath.all
    @hash = Gmaps4rails.build_markers(@baths) do |bath, marker|
      location_link = view_context.link_to bath.address, showbath_path(bath)
      marker.lat bath.latitude
      marker.lng bath.longitude
      marker.infowindow "<b>#{location_link}</b>"
      marker.picture({
      :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=A|FF0000|000000", # up to you to pass the proper parameters in the url, I guess with a method from device
      :width   => 32,
      :height  => 32
      })
    end

  end
  
  
  
  private
  
  def colorfind
    if current_bath.rating==0
      @color = red
      
    else
      @color = green
    end
    
  end
end