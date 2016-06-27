require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:dallan)
    @user2 = users(:csil)
  end

  test "to see if info is displayed properly for admin" do
     get login_path
    post login_path, session: { email: @user.email, password: 'dallan' }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert  text: @user.name
    assert text: @user.role
    assert text: @user.email
    assert  text: @user2.name
    assert text: @user2.role
    assert text: @user2.email
  end
 
  test "to see if info is displayed properly for regular user" do
     get login_path
    post login_path, session: { email: @user2.email, password: 'dallan' }
    assert is_logged_in?
    assert_redirected_to @user2
    follow_redirect!
    assert_template 'users/show'
    assert  text: @user2.name
    assert text: @user2.role
    assert text: @user2.email
  end 
  
end