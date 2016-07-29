require 'rails_helper'

RSpec.describe Bath, type: :model do
    before(:all)do
        @bath = create(:bath)
        @user = create(:user)
    end