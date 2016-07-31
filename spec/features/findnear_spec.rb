require 'rails_helper'
RSpec.feature "find near" do
    scenario "toilet male(regular user) and admin!" do
        male = create(:male)
        female = create(:female)
        bath = create(:bath)
        admin = create(:user)
        sign_in male
        visit '/locations'
        expect(page).to have_content("These are the baths near you")
        expect(page).to have_content("North Vancouver")
        
        
    end
end