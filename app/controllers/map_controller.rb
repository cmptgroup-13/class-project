class MapController < ApplicationController
  # for now lets just authenticate before checking map
  before_action :authenticate_user!, :set_long_lat
  
  def index
    @baths = Bath.where(:admin_accept => true)
    # @baths.each do |bath|
    #   @reviews = Review.where(bath_id: bath)
    #   if @reviews.blank?
    #     @avg_rating = 0
    #   else
    #     @avg_rating = @reviews.average(:rating).round(2)
    #   end
    # end  
    @hash = Gmaps4rails.build_markers(@baths) do |bath, marker|
      location_link = view_context.link_to  bath.address, view_path(bath)
      marker.lat bath.latitude
      marker.lng bath.longitude
      marker.infowindow "<b>#{location_link}</b>"
      #<b>#{@avg_rating}</b>
      bob = "/images/toiletg.png"
      if(bath.reviews.count ==0)
        image = "images/toiletmain.png"
      elsif(bath.reviews.average(:rating).round(2)>=4)
          image = "/images/toiletg.png"
      elsif(bath.reviews.average(:rating).round(2)>=3)
          image = "/images/toilety.png"
      elsif(bath.reviews.average(:rating).round(2)>=2)
          image = "/images/toileto.png"
      elsif(bath.reviews.average(:rating).round(2)>=1)
          image = "/images/toiletr.png"
      end
      marker.picture({

        :url => image, # up to you to pass the proper parameters in the url, I guess with a method from device
        :width   => 50,
        :height  => 50
      })
    end
    @me = Gmaps4rails.build_markers(current_user) do |current_user, marker|
      # location_link = view_context.link_to  bath.address, showbath_path(bath)
      marker.lat current_user.latitude
      marker.lng current_user.longitude
      marker.infowindow "<b>#{current_user.name}</b>"
      marker.picture({
      #"url" => current_user.image.url(:mini), # up to you to pass the proper parameters in the url, I guess with a method from device
      :url => "http://emojistatic.github.io/images/32/1f4a9.png", # up to you to pass the proper parameters in the url, I guess with a method from device
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
  
  def gmaps4rails_marker_picture
  {
    "rich_marker" =>  "<div class='my-marker'>It works!<img height='30' width='30' src='urinelucklogo.png'/></div>"
  }
end
end