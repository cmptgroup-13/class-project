require "spec_helper"

    

    describe "profile edit" do
        it "edit the profile" do
            user = User.create(:email    => "steven@adams.com",
            :password => "ilovenz", :role => "admin", :name => "Steve")
                      
    
    
            visit "/users/sign_in"
    
            fill_in "Email",    :with => "steven@adams.com"
            fill_in "Password", :with => "ilovenz"
        
            click_button "Log in"
            
            #click profile
            click_link "Profile"
            page.should have_content("Edit User")
            
            #now lets try to change the password of this user to ilovenz
            fill_in "Password",     :with => "ilovekd"
            fill_in "Password confirmation",     :with => "ilovekd"
            fill_in "Current password",     :with => "ilovenz"
            click_button "Update"
            
            #now lets logout and log back in again to see if the password was changed
            visit "/users/sign_out"
            page.should have_content("Signed out successfully.")
            fill_in "Email",    :with => "steven@adams.com"
            fill_in "Password", :with => "ilovekd"
            click_button "Log in"
            page.should have_content("Bathroom Connoissuer")
        end
         
            
    
        
    end