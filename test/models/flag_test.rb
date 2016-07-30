require 'test_helper'

class FlagTest < ActiveSupport::TestCase
  def setup 
    @flag = Flag.new(reason: "This bathroom is god awful", review_id: 2, user_id:1)
  end
  
  test "should be valid" do
    assert @flag.valid?
  end
  
  test "flag should have attached user id" do
      @flag.user_id = nil
      assert_not @flag.valid?
  end
      
  test "flag should have attached review id" do
      @flag.review_id = nil
      assert_not @flag.valid?
  end
  
    test "flag should not exceed 100 characters" do
         @flag.post= ""
        (0..100).each do |i|
            @flag.post += "c"
        end
    assert_not @flag.valid?
  end 
 end