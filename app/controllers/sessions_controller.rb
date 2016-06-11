class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      
      flash[:success] = "Welcome to UrineLuck" 
      redirect_to home_path
    else
      flash.now[:danger] = "Your email or password does not match"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Good Bye"
    redirect_to '/login'
  end
end
