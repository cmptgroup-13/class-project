require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:csil)
  end
  
  test "login with valid information followed by logout" do
    get login_path
    post login_path, session: { email: @user.email, password: 'dallan' }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path

    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
    
  test "invalid login information no email" do
    get login_path
    assert_no_difference 'User.count' do
      post login_path, session: {              email: "",
                                            password:              "dallan",
                                            }
    end
    assert_template 'sessions/new'
    assert_not flash.empty?
  end
  
  test "invalid login information no password" do
    get login_path
    assert_no_difference 'User.count' do
      post login_path, session: {              email: "smells@sfu.ca",
                                            password:              "",
                                            }
    end
    assert_template 'sessions/new'
    assert_not flash.empty?
  end

end