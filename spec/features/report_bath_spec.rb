require 'rails_helper'
RSpec.feature "report bath" do
    scenario "female(regular user) report" do
        male = create(:male)
        female = create(:female)
        bath = create(:bath)
        sign_in male
        visit "showbath"
        click_on("View")
        expect(page).to have_content("1400 Riverside Drive")
        click_on("Leave A Review")
        expect(page).to have_content("Rating")
        select 5, from: "Rating"
        fill_in "Post", with: "Im a fan"
        click_on("Create Review")
        expect(page).to have_content("Im a fan")
        visit "/users/sign_out"
        fill_in "Email", with: female.email
        fill_in "Password", with: female.password
        click_on("Log in")
        visit "showbath"
        click_on("View")
        expect(page).to have_content("Im a fan")
        click_on("Report")
        expect(page).to have_content("Can you please")
        fill_in "Reason", with: "dumb"
        click_on("Submit Complaint")
        expect(page).to have_content("Reported")
        
    end
    
        scenario "admin report" do
        male = create(:male)
        female = create(:female)
        admin = create(:user)
        bath = create(:bath)
        sign_in male
        visit "showbath"
        click_on("View")
        expect(page).to have_content("1400 Riverside Drive")
        click_on("Leave A Review")
        expect(page).to have_content("Rating")
        select 5, from: "Rating"
        fill_in "Post", with: "Im a fan"
        click_on("Create Review")
        expect(page).to have_content("Im a fan")
        visit "/users/sign_out"
        fill_in "Email", with: female.email
        fill_in "Password", with: female.password
        click_on("Log in")
        visit "showbath"
        click_on("View")
        expect(page).to have_content("Im a fan")
        click_on("Report")
        expect(page).to have_content("Can you please")
        fill_in "Reason", with: "dumb"
        click_on("Submit Complaint")
        expect(page).to have_content("Reported")
        visit "/users/sign_out"
        fill_in "Email", with: admin.email
        fill_in "Password", with: admin.password
        click_on("Log in")
        visit "showbath"
        click_on("View")
        expect(page).to have_content("Im a fan")
        click_on("Report")
        expect(page).to have_content("Can you please")
        fill_in "Reason", with: "dumbo"
        click_on("Submit Complaint")
        expect(page).to have_content("Reported")
        visit "/report"
        expect(page).to have_content("Drizzy Drake")
        click_on("Destroy")
        expect(page).to have_content("Review Deleted")
        
    end
end