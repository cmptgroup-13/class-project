require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  
  def setup
    @user = User.new(name: "Dallan Bhatti", email: "dbhatti@sfu.ca", password: "password", role: "admin") 
    # this should fail because we are missing a name 
    @user2= User.new(name: "", email: "dbhatti1@sfu.ca", password: "password", role: "admin")  
  end
  
  test "should be valid" do
    assert @user.valid?
   
  end
  

  
  
end
