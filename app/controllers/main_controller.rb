class MainController < ApplicationController
  def index
    authenticate_user!
  end
  
  def directions
    authenticate_user!
    @bath = Bath.find(params[:id])
  end

  def nearme
    authenticate_user!
    if params[:search].present?
      @baths = Bath.near(params[:search], 50).where(:admin_accept => true)
    end  
      @baths = Bath.near([current_user.latitude, current_user.longitude], 10).where(:admin_accept => true)
    
  end

  def show
    authenticate_user!
    # @user = User.all
    @user = User.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    authenticate_user!
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
