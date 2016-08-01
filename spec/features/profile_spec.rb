require 'rails_helper'
RSpec.feature "profile " do

    scenario "for admin" do
        admin = create(:user)
        female = create(:female)
        sign_in admin
        visit 'profile'
        expect(page).to have_content("Profile")
        expect(page).to have_content("James Harden")
        expect(page).to have_content("jharden@sfu.ca")
        expect(page).to have_content("female")
        visit 'users/edit'
        expect(page).to have_content("Edit User")
        expect(page).to have_content("Cancel my account")
        fill_in "Name", with: "Charles Barkley"
        fill_in "Email", with: "cbark@sfu.ca"
        fill_in "Password", with: "dallanb"
        fill_in "Password confirmation", with: "dallanb"
        fill_in "Current password", with: "dallan"
        click_on("Update User")
        expect(page).to have_content("updated successfully")
        visit 'profile'
        expect(page).to have_content("Charles Barkley")
        visit 'users/edit'
        click_on("Cancel my account")
        expect(page).to have_content("Bye! Your account has been successfully cancelled")
        fill_in "Email", with: "cbark@sfu.ca"
        fill_in "Password", with: "dallanb"
        click_on("Log in")
        expect(page).to have_content("Invalid Email or password")
    end
    
    scenario "for female(regular user)"do
        admin = create(:user)
        female = create(:female)
        sign_in female
        visit 'profile'
        expect(page).to have_content("Profile")
        expect(page).to have_content("Hilary Clinton")
        expect(page).to have_content("clint@sfu.ca")
        expect(page).to have_content("female")
        visit 'users/edit'
        expect(page).to have_content("Edit User")
        expect(page).to have_content("Cancel my account")
        fill_in "Name", with: "Bill Clinton"
        fill_in "Email", with: "bcLInt@sfu.ca"
        fill_in "Password", with: "dallanb"
        fill_in "Password confirmation", with: "dallanb"
        fill_in "Current password", with: "dallan"
        click_on("Update User")
        expect(page).to have_content("updated successfully")
        visit 'profile'
        expect(page).to have_content("Bill Clinton")
        visit 'users/edit'
        click_on("Cancel my account")
        expect(page).to have_content("Bye! Your account has been successfully cancelled")
        fill_in "Email", with: "bcLInt@sfu.ca"
        fill_in "Password", with: "dallanb"
        click_on("Log in")
        expect(page).to have_content("Invalid Email or password") 
    end
    
end