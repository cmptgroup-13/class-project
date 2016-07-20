class BathsController < ApplicationController
  before_action :authenticate_user!, :set_long_lat
  
  def new
    
    @bath = Bath.new
  end

    
  def create
    
    @bath = current_user.baths.new(bath_params)
    adminAccept
    if @bath.save
      flash[:success] = "Successfully submitted"
      if isAdmin?
        redirect_to @bath
      else
        redirect_to request_path
      end
    else
      render 'new'
    end
    
  end
 
 
  def index
    
  end

  def show
      @baths = Bath.all
  end  
  
  def showsingle
    @bath = Bath.find(params[:id])
    @reviews = Review.where(bath_id: @bath)
    if @reviews.blank?
     @avg_rating = 0
    else
     @avg_rating = @reviews.average(:rating).round(2)
    end
    
       
  end

    
  def edit
    if isAdmin?
      @baths = Bath.where(:admin_accept => false)
    else
      redirect_to request_path
    end
  end
  
  def update
    @baths = Bath.where(:admin_accept => false)
    @bath = Bath.find(params[:id])
    if @bath.update_attributes(bath_params)
    render 'edit'
    end

  end
  
  def requests
    @baths = Bath.where(:user_id => current_user.id)
  end
  

  def destroy
    Bath.find(params[:id]).destroy
    
    redirect_to newbath_path, notice: "Bathroom Deleted"
  end
  private
    
  def bath_params
    params.require(:bath).permit(:city, :address, :province,
                                   :country, :latitude, :longitude, :admin_accept, :apartment, :image)
  end 
  

  
  def count_state_match?
    current_baths.country == "CAN"
  end
end

