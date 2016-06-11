class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
    @userb = User.all
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end



  def edit
  end

  def update
  end

  def destroy
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role)
    end
end
