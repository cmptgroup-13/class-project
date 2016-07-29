require 'rails_helper'

RSpec.describe User, type: :model do
    before(:all)do
        @user = User.create(name: "Lebron James", email: "lbj@sfu.ca", password: "dallan", 
        password_confirmation: "dallan", ip_address: "142.58.35.86", role: "admin")
    end
    
    it "should have a matching name"do
        expect(@user.name).to eq("Lebron James")
    end
    
    it "should have a matching email"do
        expect(@user.email).to eq("lbj@sfu.ca")
    end
    
    it "should have a matching role"do
        expect(@user.role).to eq("admin")
    end
    
    it "should have a matching ip_address"do
        expect(@user.ip_address).to eq("142.58.35.86")
    end
    
    it "should have a properly calculated longitude"do
        expect(@user.longitude).to eq(-122.9369)
    end
    
    it "should have a properly calculated latitude"do
        expect(@user.latitude).to eq(49.264)
    end
    
    it "should have a matching id"do
        expect(@user.id).to eq(1)
    end
    
    it "should have a matching password"do
        expect(@user.password).to eq("dallan")
    end
    
    #fail cases
    it "should be invalid #1"do
        @user.id = ""
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #2"do
        @user.id = "-1"
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #3"do
        @user.name = ""
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #4"do
        @user.name = ""
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #5"do
        @user.name = "a"*100
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #6"do
        @user.email = "dfafsf"
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #7"do
        @user.email = ""
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #8"do
        @user.email = ".com"
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #9"do
        @user.password = ""
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #10"do
        @user.password = "ass"
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #11"do
        @user.role = ""
        (@user.valid?).should eql(false)
    end
    
    it "should be invalid #12"do
        @user.role = "dog"
        (@user.valid?).should eql(false)
    end
    

end