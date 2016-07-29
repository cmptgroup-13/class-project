include ApplicationHelper 
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
    
    def set_long_lat
        current_user.latitude= 49.264
        current_user.longitude= -122.9369
        current_user.save
    end
    
    def sign_in(user, options={})
        visit 'users/sign_in'
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_on("Log in")
    end
    
    # def current_user
    #     @current_user ||= user_from_remember_token
    # end