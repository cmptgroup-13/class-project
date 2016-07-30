require 'rails_helper'
RSpec.feature "user bath request" do
    scenario "female request accecpt" do
        female = create(:female)
        admin = create(:user)
        sign_in female
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1825 Riverside Drive"
        click_on("Send bathroom request")
        expect(page).to have_content("Pending")
        visit "/users/sign_out"
        expect(page).to have_content("Signed out successfully")
        fill_in "Email", with: admin.email
        fill_in "Password", with: admin.password
        click_on("Log in")
        visit "accept"
        expect(page).to have_content("Hello Admin")
        expect(page).to have_content("1825 Riverside Drive")
        click_on("Accept")
        expect(page).to have_content("Hello Admin")
        visit "/users/sign_out"
        expect(page).to have_content("Signed out successfully")
        fill_in "Email", with: female.email
        fill_in "Password", with: female.password
        click_on("Log in")
        visit 'request'
        expect(page).to have_content("Approved")
        visit 'showbath'
        expect(page).to have_content("1825 Riverside Drive")
    end

    scenario "female request deny" do
        female = create(:female)
        admin = create(:user)
        sign_in female
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1826 Riverside Drive"
        click_on("Send bathroom request")
        expect(page).to have_content("Pending")
        visit "/users/sign_out"
        expect(page).to have_content("Signed out successfully")
        fill_in "Email", with: admin.email
        fill_in "Password", with: admin.password
        click_on("Log in")
        visit "accept"
        expect(page).to have_content("Hello Admin")
        expect(page).to have_content("1826 Riverside Drive")
        click_on("Destroy")
        expect(page).to have_content("Bathroom Deleted")
        visit "/users/sign_out"
        expect(page).to have_content("Signed out successfully")
        fill_in "Email", with: female.email
        fill_in "Password", with: female.password
        click_on("Log in")
        visit 'request'
        expect(page).to have_no_content("Approved")
        visit 'showbath'
        expect(page).to have_no_content("1825 Riverside Drive")
    end
    
    #admin request is just regular create
    
    scenario "request to add a bathroom which already exists" do
        female = create(:female)
        admin = create(:user)
        sign_in female
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1826 Riverside Drive"
        click_on("Send bathroom request")
        expect(page).to have_content("Pending")
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1826 Riverside Drive"
        click_on("Send bathroom request")
        expect(page).to have_content("Longitude and latitude data show this location is already taken")
    end
    
end