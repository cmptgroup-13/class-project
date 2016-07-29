require 'rails_helper'
RSpec.feature "show single" do
    before(:all)do
        bath = create(:bath)
        admin = create(:user)
        female = create(:female)
    end
    
    
    scenario "for bath" do
    end
end
