require 'rails_helper'
RSpec.feature "create review" do

    scenario "for with admin" do
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
        click_on("View")
        click_on("Leave A Review")
        expect(page).to have_content("Create Review")
        select 5, from: "Rating"
        fill_in "Post", with: "I love this bathroom so much!"
        click_on("Create Review")
        expect(page).to have_content("I love this bathroom so much!")
        visit "/users/sign_out"
        fill_in "Email", with: female.email
        fill_in "Password", with: female.password
        click_on("Log in")
        visit 'showbath'
        click_on("View")
        expect(page).to have_content("I love this bathroom so much!")
        click_on("Leave A Review")
        select 5, from: "Rating"
        fill_in "Post", with: "Best bathroom in town"
        click_on("Create Review")
        expect(page).to have_content("town")
        visit "/users/sign_out"
         fill_in "Email", with: admin.email
        fill_in "Password", with: admin.password
        click_on("Log in")
        visit 'showbath'
        click_on("View")
        expect(page).to have_content("town")
    end
end