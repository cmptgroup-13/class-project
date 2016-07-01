class MapController < ApplicationController
  def index
    @baths = Bath.all
    @hash = Gmaps4rails.build_markers(@baths) do |bath, marker|
    marker.lat bath.latitude
    marker.lng bath.longitude
    end
  end
end