require 'test_helper'

class BathsControllerTest < ActionController::TestCase

  def setup
    @user= User.new(name: "Klay Thompson", email: "klay@gmail.com", password: "password", role: "admin") 
    # @usera = User.new(name: "Dallans Bhatti", email: "dbhatti2@sfu.ca", password: "password", role: "admin")
    @bath = Bath.new(address: "111 Wall St", city: "New York", province: "NY", country: "USA", rating: 4, user_id: 1, id: 11)
  end
  
  test "should be valid" do
    assert @user.valid?
    assert @bath.valid?
  end
end
