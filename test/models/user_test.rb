require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar", role: "admin", id: 1)
    end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be of valid length ( <51 characters)" do
    @user.name="a"*51
    assert_not @user.valid?
  end
  
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " "
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" 
    assert_not @user.valid?
  end
  
  test "role can be assigned admin" do
    @user.role = "admin"
    assert @user.valid?
  end
  
  test "role can be assigned male" do
    @user.role = "male"
    assert @user.valid?
  end
  
  test "role can be assigned female" do
    @user.role = "female"
    assert @user.valid?
  end
  
  test "role cannot be a random value" do
    @user.role = "cousin"
    assert_not @user.valid?
  end
  
  test "role cannot be unassigned" do
    @user.role = ""
    assert_not @user.valid?
  end
  
  test "email format should be correct" do
    @user.email = "db"
    assert_not @user.valid?
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "id must valid and present" do
    @user.save
    @user.id = nil
    assert_not @user.valid? 
  end


end
