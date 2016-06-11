class UsersController < ApplicationController

  def new
  end
  
  def index
        @user = User.all
  end
  
  def show
    @user = User.all
  end
  
  def create
    @user = User.new(user_params)

      if @user.save!
    
        session[:user_id] = @user.id
        redirect_to :home, notice: 'Account created successfully'
     else
        @user.errors.full_messages
        flash[:error] = 'An error occured!'
        
        render 'new'
      end
  end

private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :role)
  end
end