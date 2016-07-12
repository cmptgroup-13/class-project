class MainController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
 
    @user = User.all
  end

  def destroy
    @user = User.find(params[:id])


    if @user.destroy
        redirect_to profile_path, notice: "User deleted."
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role, :latitude, :longitude)
    end
    
    def ip_time
      @user.ip_address=@user.current_sign_in_ip
    end


end
