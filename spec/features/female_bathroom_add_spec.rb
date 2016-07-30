require 'rails_helper'
RSpec.feature "new regular female bathroom" do
    scenario "proper creation" do
        female = create(:female)
        sign_in female
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1825 Riverside Drive"
        click_on("Send bathroom request")
        expect(page).to have_content("Bathrooms that you have requested to add")
    end
    
    #wont bother doing fail tests because they are the same as admin creation and male is same as female
end
    