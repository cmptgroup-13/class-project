class MainController < ApplicationController
  def index
  end

  def show
 
    @user = User.all
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role)
    end


end
