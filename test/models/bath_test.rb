require 'test_helper'

class BathTest < ActiveSupport::TestCase

  def setup 
    @bath = Bath.new(address: "1414 Kipling Ave", city: "Abbotsford", province: "BC", country: "CAN", rating: 4, user_id: 1, id: 11, apartment: 123  )
  end

  test "should be valid" do
    assert @bath.valid?
  end
  
  test "country should be present" do
    @bath.country = ""
    assert_not @bath.valid?
  end
  
  test "country must be Canada or United States of America" do
    @bath.country = "Mexico"
    assert_not @bath.valid?
  end
  
  test "province should be present" do
    @bath.province = ""
    assert_not @bath.valid?
  end
  
  test "province must be either a US or Canadian political territory" do
    @bath.province = "Vancouver"
    assert_not @bath.valid?
  end
  
  test "city must be present" do
    @bath.city = ""
    assert_not @bath.valid?
  end
  
  test "address must be present" do
    @bath.address= ""
    assert_not @bath.valid?
  end
  
  test "rating must be present" do
    @bath.rating = ""
    assert_not @bath.valid?
  end
  
  test "rating must be greater than  or equal to 0" do
    @bath.rating= "-1"
    assert_not @bath.valid?
  end
  
  test "rating must be less than or equal to 5" do
    @bath.rating= "6"
    assert_not @bath.valid?
  end
  
  test "longitude assigned after save" do
    @bath.longitude =nil
    assert @bath.valid?

  end
  
  test "latitude assigned after save" do
    @bath.latitude = nil
    assert @bath.valid?
  end
  
  test "bath must have an id" do
    @bath.save
    @bath.id= nil
    assert_not @bath.valid?
  end
end