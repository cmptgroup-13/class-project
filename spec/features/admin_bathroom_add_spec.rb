require 'rails_helper'
RSpec.feature "new bathroom" do
    
    scenario "proper creation" do
        user = create(:user)
        visit 'users/sign_in'
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_on("Log in")
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1825 Riverside Drive"
        click_on("Create my bathroom")
        expect(page).to have_content("All bathrooms")
        visit 'showmap'
        expect(page).to have_content("North Vancouver, 1825 Riverside Drive")
    end
    
    scenario "missing city" do
        user = create(:user)
        sign_in user
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        # fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1825 Riverside Drive"
        click_on("Create my bathroom")
        expect(page).to have_content("City can't be blank")
    end

    scenario "missing address" do
        user = create(:user)
        sign_in user
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        # fill_in "Address", with: "1825 Riverside Drive"
        click_on("Create my bathroom")
        expect(page).to have_content("Address can't be blank")
    end
    
    scenario "add bathroom to existed address" do
        user = create(:user)
        visit 'users/sign_in'
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_on("Log in")
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1825 Riverside Drive"
        click_on("Create my bathroom")
        expect(page).to have_content("All bathrooms")
        visit '/createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1825 Riverside Drive"
        click_on("Create my bathroom")
        expect(page).to have_content("Longitude and latitude data show this location is already taken")
    end
end