require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase


  def setup
    @user= User.new(name: "Klay Thompson", email: "klay@gmail.com", password: "password", role: "admin") 
    @bath = Bath.new(address: "111 Wall St", city: "New York", province: "NY", country: "USA", rating: 4, user_id: 1, id: 11)
    @review = Review.new(post: "Great Bathroom!!!", bath_id: 11, user_id: 1, id: 4)
  end
  
   test "should be valid" do
      assert @review.valid? 
   end

end
