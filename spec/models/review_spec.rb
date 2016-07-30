require 'rails_helper'

RSpec.describe Review, type: :model do
    before(:all)do
        @bath = create(:bath)
        @user = create(:user)
        @review = create(:review)
    end
    it "should have a matching post"do
        expect(@review.post).to eq("Excellent bathroom")
    end
    
    it "should have a matching rating"do
        expect(@review.rating).to eq(4)
    end

    it "should have a matching id"do
        expect(@review.id).to eq(1)
    end
    
    it "should have a matching user id"do
        expect(@review.user_id).to eq(1)
    end
    
    it "should have a matching bath id"do
        expect(@review.bath_id).to eq(1)
    end

    it "should have a matching flag count"do
        expect(@review.flag_count).to eq(1)
    end
    
    #fail cases
    it "should be invalid #1"do
        @review.post = ""
        (@review.valid?).should eql(false)
    end

    it "should be invalid #2"do
        @review.post = "a"*500
        (@review.valid?).should eql(false)
    end

    it "should be invalid #3"do
        @review.rating = ""
        (@review.valid?).should eql(false)
    end

    it "should be invalid #4"do
        @review.rating = -1
        (@review.valid?).should eql(false)
    end

    it "should be invalid #5"do
        @review.rating = 6
        (@review.valid?).should eql(false)
    end

    it "should be invalid #6"do
        @review.user_id = ""
        (@review.valid?).should eql(false)
    end

    it "should be invalid #7"do
        @review.user_id = -1
        (@review.valid?).should eql(false)
    end

    it "should be invalid #8"do
        @review.bath_id = ""
        (@review.valid?).should eql(false)
    end

    it "should be invalid #9"do
        @review.bath_id = -1
        (@review.valid?).should eql(false)
    end

    it "should be invalid #10"do
        @review.id = ""
        (@review.valid?).should eql(false)
    end

    
        
end