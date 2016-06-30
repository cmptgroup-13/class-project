class BathsController < ApplicationController
  def new
    @baths = Bath.new
  end
    
  def create
    @baths = Bath.new(bath_params)
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
 
    @baths = Bath.all
  end  
    
  def destroy
    Bath.find(params[:id]).destroy
    redirect_to newbath_path, notice: "Bathroom Deleted"
  end
  private
  
  
    
  def bath_params
    params.require(:bath).permit(:city, :address, :province,
                                   :country, :hours, :rating)
  end 
  
  def current_bath
    @current_baths ||= Bath.find_by(id: session[:bath_id])
  end
  
  def count_state_match?
    current_baths.country == "CAN"
  end
end

