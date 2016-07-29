require "rails_helper"
RSpec.feature "signup users" do

    scenario "create user" do
        visit 'users/sign_up'
        fill_in "Name", with: "Chris Paul"
        fill_in "Email", with: "cp3@sfu.ca"
        fill_in "Password", with: "dallan"
        fill_in "Password confirmation", with: "dallan"
        select 'Male', from: "Role"
        click_on("Create User")
        expect(page).to have_content("Welcome! You have signed up successfully.")
     end
     
    scenario "missing name" do
        visit 'users/sign_up'
        # fill_in "Name", with: "Chris Paul"
        fill_in "Email", with: "cp3@sfu.ca"
        fill_in "Password", with: "dallan"
        fill_in "Password confirmation", with: "dallan"
        select 'Male', from: "Role"
        click_on("Create User")
        expect(page).to have_content("Name can't be blank")
     end
     
     scenario "missing email" do
        visit 'users/sign_up'
        fill_in "Name", with: "Chris Paul"
        # fill_in "Email", with: "cp3@sfu.ca"
        fill_in "Password", with: "dallan"
        fill_in "Password confirmation", with: "dallan"
        select 'Male', from: "Role"
        click_on("Create User")
        expect(page).to have_content("Email can't be blank")
     end  
     
     scenario "missing password" do
        visit 'users/sign_up'
        fill_in "Name", with: "Chris Paul"
        fill_in "Email", with: "cp3@sfu.ca"
        # fill_in "Password", with: "dallan"
        fill_in "Password confirmation", with: "dallan"
        select 'Male', from: "Role"
        click_on("Create User")
        expect(page).to have_content("Password can't be blank")
     end  
     
     scenario "missing role" do
        visit 'users/sign_up'
        fill_in "Name", with: "Chris Paul"
        fill_in "Email", with: "cp3@sfu.ca"
        fill_in "Password", with: "dallan"
        fill_in "Password confirmation", with: "dallan"
        # select 'Male', from: "Role"
        click_on("Create User")
        expect(page).to have_content("Role can't be blank")
     end  
     
end