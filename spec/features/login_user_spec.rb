require 'rails_helper'
RSpec.feature "login users" do
    
    scenario "allow login of a user" do
        user = create(:user)
        
        visit 'users/sign_in'
        fill_in "Email", with: "jharden@sfu.ca"
        fill_in "Password", with: "dallan"
        
        click_on("Log in")
        
        expect(page).to have_content("Signed in successfully")
    end
    
    scenario "disallow user with improper info" do
        user = create(:user)
        visit 'users/sign_in'
        fill_in "Email", with: "stephcurry@sfu.ca"
        fill_in "Password", with: "dallan"
        
        click_on("Log in")
        
        expect(page).to have_content("Invalid Email or password")
    end
    
    scenario "display error if missing email" do
        user = create(:user)
        visit 'users/sign_in'
        # fill_in "Email", with: "stephcurry@sfu.ca"
        fill_in "Password", with: "dallan"
        
        click_on("Log in")
        
        expect(page).to have_content("Invalid Email or password")
    end
    
    scenario "display error if missing password" do
        user = create(:user)
        visit 'users/sign_in'
        fill_in "Email", with: "stephcurry@sfu.ca"
        # fill_in "Password", with: "dallan"
        
        click_on("Log in")
        
        expect(page).to have_content("Invalid Email or password")
    end
    
    scenario "should be taken to proper page 'forgot password'" do
        user = create(:user)
        visit 'users/sign_in'
        click_on("Forgot your password?")
        expect(page).to have_content("Forgot your password?")
        fill_in "Email", with: "jharden@sfu.ca"
        click_on("Send me reset password instructions")
        expect(page).to have_content("You will receive an email with instructions on how to reset your password in a few minutes.") 
    end
    
    scenario "should be able to use utilities function" do
        user = create(:user)
        sign_in user
    end
    

end