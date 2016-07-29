require 'rails_helper'
RSpec.feature "show single" do

    scenario "for bath" do
        admin = create(:user)
        female = create(:female)
        sign_in admin
        visit 'createbath'
        expect(page).to have_content("Please fill in all required fields to add your bathroom")
        select 'Canada', from: "Country"
        select 'British Columbia', from: "Province/State"
        fill_in "City", with: "North Vancouver"
        fill_in "Address", with: "1825 Riverside Drive"
        click_on("Create my bathroom")
        expect(page).to have_content("1825 Riverside Drive")
        click_on("View")
        expect(page).to have_content("Location")
        expect(page).to have_content("1825 Riverside Drive")
        expect(page).to have_content("Leave A Review")
        click_on("Leave A Review")
        expect(page).to have_content("Rating")
        select 5, from: "Rating"
        fill_in "Post", with: "I love this bathroom it is very clean and tidy"
        click_on("Create Review")
        expect(page).to have_content("I love this bathroom it is very clean and tidy")
        expect(page).to_not have_content("No reviews yet")
        expect(page).to have_content("No images added yet!")
        expect(page).to have_css('div#map')
        click_on("Destroy")
        expect(page).to have_content("No reviews yet")
        click_on("Leave A Review")
        expect(page).to have_content("Rating")
        select 1, from: "Rating"
        fill_in "Post", with: "I hate this bathroom very much"
        click_on("Create Review")
        expect(page).to have_content("I hate this bathroom very much")
        click_on("Edit")
        expect(page).to have_content("I hate this bathroom very much")
        select 4, from: "Rating"
        fill_in "Post", with: "I actually like it alot"
        click_on("Submit edit")
        expect(page).to have_content("I actually like it alot")
        visit "/users/sign_out"
        fill_in "Email", with: female.email
        fill_in "Password", with: female.password
        click_on("Log in")
        visit "showbath"
        click_on("View")
        expect(page).to have_content("1825 Riverside Drive")
        expect(page).to have_content("Report")
        click_on("Report")
        expect(page).to have_content("Can you please give your reason for reporting this review")
        fill_in "Reason", with: "This guy is crazy"
        click_on("Submit Complaint")
        expect(page).to have_content("Reported")
        
        
    end
end