require 'rails_helper'

RSpec.describe Flag, type: :model do
    before(:all)do
        @bath = create(:bath)
        @user = create(:user)
        @review = create(:review)
        @flag = create(:flag)
    end
    it "should have a matching reason"do
        expect(@flag.reason).to eq("racism")
    end

    it "should have a matching count"do
        expect(@flag.count).to eq(0)
    end

    it "should have a matching user id"do
        expect(@flag.user_id).to eq(1)
    end

    it "should have a matching review id"do
        expect(@flag.review_id).to eq(1)
    end
    
    #fail case
    
    it "should be invalid #1"do
        @flag.reason = ""
        (@flag.valid?).should eql(false)
    end

    it "should be invalid #2"do
        @flag.reason = "a"*101
        (@flag.valid?).should eql(false)
    end

    it "should be invalid #3"do
        @flag.user_id = ""
        (@flag.valid?).should eql(false)
    end

    it "should be invalid #4"do
        @flag.user_id = -1
        (@flag.valid?).should eql(false)
    end

    it "should be invalid #5"do
        @flag.review_id = ""
        (@flag.valid?).should eql(false)
    end

    it "should be invalid #6"do
        @flag.review_id = -1
        (@flag.valid?).should eql(false)
    end

end