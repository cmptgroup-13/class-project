class BathsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @baths = Bath.new
  end

    
  def create
    
    @baths = current_user.baths.new(bath_params)
      if @baths.save
      flash[:success] = "Successfully submitted"
        redirect_to @baths
      else
      render 'new'
      end
    
  end
 
 
  def index
    
  end

  def show
    
    if(current_user.role == "admin")
      @baths = Bath.all
    else
      @baths = current_user.baths
    end
  end  
    
    
  def showreview
  end
  
  def newreview
    # @bath = Bath.find_by(id: session[:bath_id])
    @bath = current_user.baths.find_by_id(params[:id])
    @review = @bath.rating
  end
  
  def destroy
    Bath.find(params[:id]).destroy
    redirect_to newbath_path, notice: "Bathroom Deleted"
  end
  private
  
  
    
  def bath_params
    params.require(:bath).permit(:city, :address, :province,
                                   :country, :rating, :latitude, :longitude, :latitude, :longitude)
  end 
  

  
  def count_state_match?
    current_baths.country == "CAN"
  end
end

