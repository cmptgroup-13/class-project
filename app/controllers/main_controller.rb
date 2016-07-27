class MainController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  
  def directions
    @bath = Bath.find(params[:id])
  end

  def single
   
  end
  
  def nearme
    if params[:search].present?
      @baths = Bath.near(params[:search], 50).where(:admin_accept => true)
    end  
      @baths = Bath.near([current_user.latitude, current_user.longitude], 10).where(:admin_accept => true)
    
  end
  
  
  def practice
    @lat_lng = cookies[:lat_lng].try(:split, "|")
    current_user.latitude=@lat_lng[0]
    current_user.longitude=@lat_lng[1]
  end
  
  def show
 
    # @user = User.all
    @user = User.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @user = User.find(params[:id])
    @reviews = @user.reviews.all
    @reviews.each do |review|
      review.destroy
    end
    if @user.destroy && @reviews.count == 0 
        redirect_to profile_path, notice: "User deleted."
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role, :latitude, :longitude, :image)
    end
    
    def ip_time
      @user.ip_address=@user.current_sign_in_ip
    end


end
