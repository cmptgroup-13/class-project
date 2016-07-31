require 'rails_helper'

RSpec.describe Bath, type: :model do
    before(:all)do
        @bath = create(:bath)
        @user = create(:user)
    end
    it "should have a matching address"do
        expect(@bath.address).to eq("1400 Riverside Drive")
    end
    it "should have a matching country"do
        expect(@bath.country).to eq("CAN")
    end
    it "should have a matching province"do
        expect(@bath.province).to eq("BC")
    end
    it "should have a matching id"do
        expect(@bath.user_id).to eq(@user.id)
    end
    it "should have a matching longitude"do
        expect(@bath.longitude).to eq(-123.010975)
    end
    it "should have a matching latitude"do
        expect(@bath.latitude).to eq(49.32013200000001)
    end

    #test invalid params!
    it "should be invalid #1"do
        @bath.address = ""
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #2"do
        @bath.province = ""
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #3"do
        @bath.country = ""
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #4"do
        @bath.longitude = ""
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #5"do
        @bath.latitude = ""
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #6"do
        @bath.user_id = ""
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #7"do
        @bath.admin_accept = ""
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #8"do
        @bath.address = "a"*41
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #9"do
        @bath.city = "a"*41
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #10"do
        @bath.country = "GBR"
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #11"do
        @bath.country = "Canada"
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #12"do
        @bath.province = "British Columbia"
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #13"do
        @bath.province = "NYC"
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #14"do
        @bath.longitude = -178
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #15"do
        @bath.longitude = 0
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #16"do
        @bath.latitude = 20
        (@bath.valid?).should eql(false)
    end
    it "should be invalid #16"do
        @bath.latitude = 1000
        (@bath.valid?).should eql(false)
    end
    
    

end