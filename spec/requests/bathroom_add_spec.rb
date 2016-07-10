require "spec_helper"

describe "bathroom new" do
  it "allows users to sign in after they have registered" do
    user = User.create(:email    => "alindeman@example.com",
                      :password => "ilovegrapes", :role => "admin", :name => "Adam")
    user1 = User.create(:email    => "russell@westbrook.com",
                      :password => "iloveokc", :role => "male", :name => "Rusty")

    visit "/users/sign_in"

    fill_in "Email",    :with => "alindeman@example.com"
    fill_in "Password", :with => "ilovegrapes"

    click_button "Log in"

    page.should have_content("Signed in successfully.")
    
    visit "/createbath"
    
    select('Canada', :from=>'Country')  
    select('British Columbia', :from=>'Province/State')
    fill_in "City", :with => "North Vancouver"
    fill_in "Address", :with => "1701 Riverside Drive"
    fill_in "Rating", :with => "5"

    click_button "Send bathroom request"
    
    # we should get redirected to the show bathroom page
    page.should have_content("These are the bathrooms in the database")
    page.should have_content("Riverside Drive")
    
    #lets create a review
    visit "/baths/1/reviews/new"
    
    page.should have_content("Post")
    fill_in "Post", :with => "this bathroom is very clean and makes me feel very comfortable"
    click_button "Create my review"
    
    # this page should have review left by current_user
    page.should have_content("Adam")
    
    #make another review
    visit "/baths/1/reviews/new"
    
    page.should have_content("Post")
    fill_in "Post", :with => "i lied i don't like this bathroom"
    click_button "Create my review"
    
    # this is too show the second review we just left
    page.should have_content("i lied")
    # this will show the first review which was previously left
    page.should have_content("very clean")
    
    #go back to bathroom main page so we can create another bathroom 
    visit "/newbath"
    page.should have_content("View bathroom requests")
    
    #go to createbath path
    visit "/createbath"
    
    select('Canada', :from=>'Country')  
    select('British Columbia', :from=>'Province/State')
    fill_in "City", :with => "Abbotsford"
    fill_in "Address", :with => "451 Columbia Street"
    fill_in "Rating", :with => "4"
    click_button "Send bathroom request"
    
    #again hoping we get redirected to show page
    page.should have_content("Abbotsford")
    #the previous bathroom should still be there
    page.should have_content("North Vancouver")
    
    #lets try logging out and signing in with a new user
    visit "/users/sign_out"
    page.should have_content("Signed out successfully.")
    
    #we should also be at the sign in page
    page.should have_content("Log in")
    fill_in "Email",    :with => "russell@westbrook.com"
    fill_in "Password", :with => "iloveokc"
    click_button "Log in"
    
    #again we should be on the home page
    page.should have_content("Bathroom Connoissuer?")
    
    #let us try to request to add a bathroom
    visit "/newbath"
    visit "/createbath"
    select('Canada', :from=>'Country')  
    select('British Columbia', :from=>'Province/State')
    fill_in "City", :with => "Burnaby"
    fill_in "Address", :with => "881 University Drive"
    fill_in "Rating", :with => "4"
    click_button "Send bathroom request"
    
    #since this user is a regular user we should get redirected to request page
    page.should have_content("Bathrooms that you have requested to add")
    page.should have_content("Pending")
    
    #now i will try to add a review as a regular user
    

    
  end
end