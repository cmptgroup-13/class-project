class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper
  
  helper_method :current_bath, :isAdmin?, :adminAccept, :remote_ip, :set_ip
  
  private
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  protected
  
   def configure_permitted_parameters

    devise_parameter_sanitizer.for(:update) { |u| u.permit(:name, :role, :password, :current_password, :password_confirmation, :email) }
   end
  
  

end
