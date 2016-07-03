class MainController < ApplicationController
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
                                   :password_confirmation, :role)
    end


end
