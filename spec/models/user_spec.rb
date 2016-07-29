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
    
    # continue this!
end