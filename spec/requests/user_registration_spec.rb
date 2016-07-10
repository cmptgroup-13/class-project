# require "spec_helper"

# describe "user registration" do
#   it "allows new users to register with an email address and password" do
#     visit "/users/sign_up"

#     fill_in "Name",                  :with => "Adam"
#     fill_in "Email",                 :with => "alindeman@example.com"
#     fill_in "Password",              :with => "ilovegrapes"
#     fill_in "Password confirmation", :with => "ilovegrapes"
#     choose("male")    

#     click_button "Sign up"

#     page.should have_content("Welcome! You have signed up successfully.")
#   end
# end