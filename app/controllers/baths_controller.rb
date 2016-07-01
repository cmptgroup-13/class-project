class BathsController < ApplicationController
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
      @baths = current_user.baths.find(params[:user])
    end
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

