require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup 
    @review = Review.new(post: "This bathroom is god awful", id:1, bath_id: 2, user_id:1)
  end
  
  test "should be valid" do
    assert @review.valid?
  end
  
  test "post should not be empty" do
    @review.post= "" 
    assert_not @review.valid?
  end
  
  test "each review needs a bathroom to which it belongs" do
    
    @review.bath_id = nil
    assert_not @review.valid?
  end
  
  test "each review needs a user to which it belongs" do
    @review.user_id = nil
    assert_not @review.valid?
  end
  
  test "review should not exceed 300 characters" do
    
    @review.post= ""
    (0..300).each do |i|
      @review.post += "c"
    end
    assert_not @review.valid?
  end 
  
  test "review rating should not be below 0" do
    @review.rating = "-1"
    assert_not @review.valid?
  end
  
  test "review rating should not be above 5" do
    @review.rating = "6"
    assert_not @review.valid?
  end
  
  test "review rating should be a number" do
    @review.rating = "a"
    assert_not @review.valid?
  end
end