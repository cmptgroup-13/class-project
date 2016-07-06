require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "1Example User",
                                            email: "user1@example.com",
                                            password:              "password",
                                            password_confirmation: "password",
                                            role: "male"}
    end
    assert_template 'users/show'
    assert is_logged_in?
    assert_not flash.empty?
  end
  
  test "invalid signup information no role" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "1Example User",
                                            email: "user1@example.com",
                                            password:              "password",
                                            password_confirmation: "password",
                                            role: ""}
    end
    assert_template 'users/new'
    assert flash.empty?
  end
  
  test "invalid signup information no password" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "1Example User",
                                            email: "user1@example.com",
                                            password:              "",
                                            password_confirmation: "",
                                            role: "male"}
    end
    assert_template 'users/new'
    assert flash.empty?
  end
  
  test "invalid signup information mismatching password and password confirm" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "1Example User",
                                            email: "user1@example.com",
                                            password:              "password",
                                            password_confirmation: "passord",
                                            role: "male"}
    end
    assert_template 'users/new'
    assert flash.empty?
  end
  
  test "invalid signup information no email" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "1Example User",
                                            email: "user1@e",
                                            password:              "password",
                                            password_confirmation: "password",
                                            role: "male"}
    end
    assert_template 'users/new'
    assert flash.empty?
  end

  test "invalid signup information no name" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                                            email: "user1@email.com",
                                            password:              "password",
                                            password_confirmation: "password",
                                            role: "male"}
    end
    assert_template 'users/new'
    assert flash.empty?
  end
end