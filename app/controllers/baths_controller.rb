class BathsController < ApplicationController
  def new
    @baths = Bath.new
  end
    
  def create
    @baths = Bath.new(bathroom_params)
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
    
  private
    
  def bathroom_params
    params.require(:bath).permit(:address, :city, :province,
                                   :country, :hours, :rating)
  end    
end

