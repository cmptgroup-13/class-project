class BathsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @baths = Bath.new
  end

    
  def create
    @baths = current_user.baths.new(bath_params)
    if current_user.role == "admin"
      @baths.admin_accept = true
    else
      # get rid of this and always set admin_accept to false
      @baths.admin_accept = false
    end
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
    
    # if(current_user.role == "admin")
      @baths = Bath.all
    # else
    #   @baths = current_user.baths

    # end
    
  end  
  
  def showsingle
     @bath = Bath.find(params[:id])
     

     
  end

    
  def edit
    @baths = Bath.where(:admin_accept => false)
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
                                   :country, :rating, :latitude, :longitude, :latitude, :longitude, :admin_accept)
  end 
  

  
  def count_state_match?
    current_baths.country == "CAN"
  end
end

