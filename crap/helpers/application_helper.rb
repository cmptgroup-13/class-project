module ApplicationHelper

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success" # Green
      when :error
        "alert-danger" # Red
      when :alert
        "alert-warning" # Yellow
      when :notice
        "alert-info" # Blue
      else
        flash_type.to_s
    end
  end
  
  def current_bath
    @current_bath ||= current_user.baths.find_by_id(params[:bath_id])
  end

  def isAdmin?
    current_user.role == "admin"
  end
  
  def adminAccept
    if isAdmin?
      @bath.admin_accept=true
    else
      @bath.admin_accept=false
    end
  end
  
  def remote_ip
      @remote_ip ||= (get_header("action_dispatch.remote_ip") || ip).to_s
  end
  
  def set_ip
    @user.ip_address= request.remote_ip
  end
  
end