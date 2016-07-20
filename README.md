Project by: Dallan Bhatti, Alex Nguyen, Dawson Perron, Dylan Wang, Yolanda Yao

For latest WORKING version visit: https://cmpt276group13project.herokuapp.com/
For latest TESTING version visit: https://my-test-app-cmpt276.herokuapp.com/

Admin User:
Username: myadmin@sfu.ca
Password: password

Normal User
Username: myuser@sfu.ca
Password: password

# UrineLuck



We will be attempting to solve a problem nearly every person has faced in their life one time or another. UrineLuck is a web application that helps users locate clean, public bathroom’s while they are out and about. Users of the app will give their current location and the app will locate public bathroom’s in their immediate area and will feature a rating out of 5 stars on each bathroom. Users also are given the option to browse our CrapMap™ and plan they’re conquest in advance so they do not find themselves prairie dogging while they are shopping with friends or lawn bowling at the park. The customer will also see a list of reviews and ratings left by us or other users who have visited the bathroom and wish to inform others of their experiences using said bathroom. Currently we plan to make use of Google Maps API for the geographical components and Yelp API for the review components. 

If time permits we may attempt to develop the app for mobile devices and also add a basic game to the app so people may occupy themselves while “taking care of business”. Users will also be able to upload images of the bathroom location. We encourge selfies.

We will have two types of users Admin and Normal users. Normal users can request to add bathrooms and also report bathrooms (although these reports will likely stay hidden). Admin users will be able to add bathrooms and also remove them (Admins will be able to see reports). We are also considering adding genders to each type of user. 


## Competitive Analysis

#### SitorSquat 

As described by the app, “SitOrSquat by Charmin can help you find public restrooms near you or where you’re planning to travel. Install SitOrSquat and search, view, rate and add public restrooms to help you, your family and others enjoy the go, on the go” (https://itunes.apple.com/ca/app/sitorsquat-restroom-finder/id511855507?mt=8).

#### Flushd 

As described by the app, “The Bathroom. A hallowed yet infrequently talked about room of critical and daily importance to the lives of every human being inhabiting the non-3rd world. A room where it is safe to be at our worst. Where acts that would normally be embarrassing or humiliating by societal standards are welcomed and encouraged. A place where some of us seek refuge in an otherwise over-stimulated daily existence in order to seek some peace, tranquility and well…relief. We all hope that we walk out of the bathroom feeling a little bit better then when we walked in. We at Flushd feel that we should not take this transformation for granted. Our goal is to shine a bright light into the world of bathrooms to help increase the quality of the bathroom experience globally” (https://itunes.apple.com/ca/app/flushd/id691150346?mt=8).

## Why our app beats the competition

· Neither of these apps are very popular in Canada

· Neither of these apps have a very large university presence

· Neither of apps give the user of a Yelp type review where users can fully describe their experience

· Our app will provide a unique experience when you find your bathroom and are still using the app. (Games, bathroom facts, etc.)


## Customers

#### Sally (Customer 1): 

Sally is a female who lives an active life, working in Vancouver. Her work involves her to do a lot of driving and making quick stops. Due to the nature of her job she often finds herself in a pickle when it comes to looking for a public bathroom during the day in her immediate area. On top of this struggle Sally knows that if she does find a bathroom, there is a decent chance it is dimly lit, the door doesn’t lock on the stall, and the toilet paper is out. She needs a better way to find clean bathrooms in her area, where she can be confident these are sanitary and well maintained.

#### Bob (Customer 2): 

Bob is a male who attends Simon Fraser University as a computer science student. Bob has been mentally and physically scarred from 3 years of usage of the men’s CSIL bathroom. As much as he loves the moist atmosphere combined with the fish market smell, Bob wants change! Bob has always dreamed of the day he could venture out and find a different bathroom at SFU that doesn’t require a post-use daily hepatitis shot. If only he had a web app that could help him locate a bathroom which suits his needs.



##User Stories/Epics

##Epic: As a user, I can do operations with bathrooms
Stories:

####As a user, I want to request to add bathrooms (2)
It should accept a Country, a City, a province/state an address, and a rating
It should validate that all of the fields (accept apt. Number) are entered
It should validate that the address is given is inside either Canada or the USA
It should validate that the rating is within 1-5
It should generate error mesages when a request is sent with any of the above errors and should not add to the database
A request should be sent when the fields are valid and send request is clicked
As an admin, a request should autmomatically be approved or have the option of sending as a request

Tests:

It meets these requirments when it passes the tests written for it in the bath_controller_test which tests for validity.
When the validation tests pass the request can be sent.

####As an admin, I want to be able to accept or deny bath requests so I can enable user input (2)
It should show all valid requests sent by users not yet added to the database.
It should have an option to delete the request and not be added to the database.
It should have an option to add the entry to the database.
The request should be removed from the request page after destroying or adding

Tests:
Tests are done to check if the bathroom has been added to the databse. If it 
has passed the test the bathroom has been added.


####As an admin, I want to be able to destroy bathrooms if I see any problems with bathroom (2)
When viewing bathrooms as an admin there should be an option to destroy each bathroom.
After selecting to detory a bathroom a notification should show up to confirm the deletion of the bathroom.
If the notification is closed the bathroom should not be deleted.
If ok is selected on the notification the bathroom should be deleted and removed from the database.

Tests:
Tests are done to ensure the bathroom has been removed from the database if the test passes the bathroom is removed.

####As a regular user or admin, I want to see a list of all bathrooms approved by the admin (2)
It should show all bathroom submitted by the current user logged in.
It should show beside each bathroom whether the entry has been aproved or not.

Tests:
Tests are done to show if what populates the table matches what's in the database.
If the tests passes the data matches.

####As a regular user or admin, I want to individually view each bathroom on its own (2)
Beside each bathroom there should be an option to view each bathroom individually.
When clicked the user should be taken to a page with that bathrooms info on it.
On the page there should be a map zoomed in on the location of the bathroom.
There should be a marker on the bathrooms location
There should be a list of reviews below the map.
There should be an option to add a review.

Tests: Tests are done to see if the bathroom shown selected matches the bathroom selected.
If the tests passes the data matches.

##Epic: As a user, I can do operations with reviews
##Stories:

####As an admin or regular user, I want to create a review (2)

It should give me a link to leave a review.
On the page to leave a review, there should be a textbox with enough space to leave a review.
Reviews over 50 characters should not be added to the database.
Blank reviews should not be added to the database.
An errror message should be given if the review is submitter with too many characters(not yet
implemented will be in iteration 3)
Upon a successful review the review should be added to the bathroom page with all the other
reviews that were there before.

Tests:
Tests are done to ensure the reviews added are valid. If the tests passes the data matches.

####As a regular user or admin, I want to be able to view each review for any given bathroom (1)

On the page for viewing many bathrooms there should be an option beside each bathroom to view the
specific bathroom.
When on the the page to view a specific bathroom there should be reviews 
left by other users underneath the map on the page.
As an admin there should be an option to delete each review. (Implemented in Iteration 3)

Tests: A test is done to ensure te data populating reviews is the same as added in the database. 
If the tests passes the data matches.

##Epic: As a user, I can do operations with Google Maps
##Stories:

####As a regular user or admin I want to see all added bathrooms on a map (3)
There should be a map with a marker for each bathroom approved by an admin and not
deleted in the database.
The map should be initialized so that all the markers are visibile on the map.
The map should let the user zoom and scroll to other perspectives.

Tests: Tests are done by the google maps API to ensure the map loads correctly. We test to make sure our markers populate the map.

####As a regular user or admin I want to be able to see a map on each personal page (3)
The map should only include one marker for that specific bathroom.
The marker should be a toilet paper icon.
The map should be initially centered on the bathroom.
The map should be initially zoomed out to include a few blocks on the map.

Tests:
The google maps api tests that the map loads correctly and we test that the marker is added correctly.

##Epic: As a user, I can have profile control
##Stories:

####As a regular user or admin, I want to edit my profile info (2)
It should let users change their name, password and email
It should require your current password in order to make changes to the profile.
It should allow only some of the fields to be edited.
New passwords should require being typed twice correctly for validation.
Blank fields, unmatching passwords, or incorrect passwords should throw an error.
When a profile is changed with an error, the error should be thrown describing the error and the profile should not be changed.
When the fields are correct the profile should be changed and edited in the database.

Tests: The devise gem handles specific tests to ensure user objects are handled correctly.

####As an admin I want to view all users in the system and delete their account (1)
There should be a profile page that lists the users stored in the database with their attributes.
It should show users that have not been destroyed or have been deleted by the user.
Beside each user there should be an option to destroy the account.
When the destroy button is clicked there should be a notifcation asking to confirm the deletion.
When the notification is closed and ok is not selected the user should remain in the database and not deleted.
When ok is selected the user should be removed from the database and no longer be able to login. 
The user should no longer be listed on the profiles page.

Tests:
Specific tests are carried out by the devise gem to make sure the user is removed from the database.
####Ass an admin or regular user I want to have the option to destroy my own account (1)
In the edit my profile page there should be an option to delete my account.
When the destroy button is clicked there should be a notifcation asking to 	confirm the deletion.
When the notification is closed and ok is not selected the user should remain in the database and not deleted.
When ok is selected the user should be removed from the database and no longer be able to login. 
The user should be taken to the login screen.

Tests:
Specific tests are carried out by the devise gem to make sure the user is removed from the database.

##Epic:	As a user I can make an account

####As a user I want to be able to create a personal account. (2)
It should ask for an name, email, gender, and password.
It should ask the user to enter their password twice.
It should validate the name doesn't already exist in the database.
It should validate the email doesn't already exist in the database.
It should validate that the passwords match.
It should validate that none of the fields are blank.
When submitted with any of the above errors an error should be thrown describing the error and the user should not be added to the database.
When the above fields are correct and create is clicked the user should be added to the database and taken to the home page.
Admins cannot be created from this page they mut be created from the console with the role 'admin'

Tests:
Specific tests are done with the devise gem that test to make sure the users are successfully added to the database and for validation on the fields and that users arent entered with inappopriate fields. 
When it passes these tests a user can be added to the database.

####As a user I want to be able to login and sign out (2)
When accessing the site a user must be logged in in order to view the other pages.
To login the user must enter a name and password that is attached to an exisitng account.
If the above is not met an error should be thrown describing the error.
If the above is met the user should be logged in.
Signing out should take the user back to the login page where they can sign on as a different user. 
The user should not be edited upon signing out or signing in.

Tests:
Specific tests are done with the devise gem that test to make sure the users are successfully added to the database and for validation on the fields and that users arent entered with inappopriate fields.
When it passes these tests a user can be added to the database.

-

##*NO EPIC STORIES

####As a regular user or admin I would like to play a secret flappy tissue game (3)
When the user clicks the screen the game starts. 
Pipes are generated at random height and the tissue starts flying forward.
 The user should be able to control the tissue by mouse clicking in order to avoid collision with the pipes.
 When the tissue hits any pipe, game is over and both this-time score and best score is shown on the screen.
 Users can choose to restart the game by clicking the restart button.

Tests:
 Tests are done to make sure pipes are generated at random heights and the game stops immediately when the tissue overlaps with any pipe.
-as a regular user or admin I would like to be able to view a contact page (1)
The contact page should contain a bio for each member of our group.
For each member there should be an image of with a short decription.
	Tests: This is a static page that needs to load.
	
####note: to play the game go to https://sheltered-anchorage-78577.herokuapp.com/game.html
	
####Future: 
-as a regular user or admin I would like to have a working remember me button on login
-as a regular user or admin I would like to have a working forgot my password button on login
-as an admin I would like to have a working delete for reviews
-as an admin I would like to have error messages for bad reviews.
-allow users to upload pictures for their profiles
-allow user to upload pictures for the bathroom they upload
-allow users to search an address for nearby bathrooms
-allow users to locate a nearby address using their proximity
-directions to nearest bathrooms
-proper stars for each rating (fix bugs)
-displaying businesses that are recognized by google
-an event page for bathroom themed events

##Iteration 1 User Stories


#### Story 1: Logging in

Logging is important as it prevents non-users from accessing the app and potentially ruining the experience for signed up members. It also helps user (male or female or admin) maintain their own personal account and allow them to have personalized interactions with UrineLuck. Display login page upon entering the web app through routing. 

In the database each member who has signed up has there information stored, which includes name, email, password, and role. Given that a recognized email and password are entered in the correct fields, when “log in” is clicked the user should be logged in. The system will check if these fields match those which are stored in the database from signup.

Given that an unrecognized email and/or password is entered in the fields, when “log in” is clicked no one should be logged in and an error message should be given. This error message will be displayed in a red box about the form stating “Invalid email/password combination”. Also if the users’ login is invalid they will be not be redirected to any other page, instead they will remain on the login page. The error message should not clear the screen until the user has visited another page or they are successfully logged in. 

It is not necessary to re-enter your name when logging in because names may be repeated but we will not allow repeat emails for obvious reasons. It is also not necessary to include role again as it is stored with the Users information at signup and has no importance in the context of simply logging in.

Upon logging in, given that I have logged in as a user (male or female), when I click “log in” a notification should tell me that I have successfully logged in. Given that I have logged in as an administrator, when I click “log in” a notification should tell me that I have successfully logged in as an administrator.

User is given the option to log out which will guide them back to the login page.

Tests are done to see if the proper error message is displayed on the screen when the user enters wrong information. 

#### Story 2: Signing Up

As a user of UrineLuck signing up is important because it allows UrineLuck to expand its database of users and allows users to create a unique individualized experience for themselves. As a user I want to be able to sign up an account which will give me access to the bathroom searching features provided by the web app. 

Given that I want to sign up, when I click “sign up” I should be taken to a form with my needed credentials. Or I will have the ability from the login page to be asked if I am a new user and would like to sign up for the app.

On the form itself it will feature the necessary fields which are 'Name', 'Email', 'Password', 'Password Confirmation' and 'Role'. Name and Email are to help distinguish between the users and in the future will allow the app to email users if information is lost, a password reset is needed, or to email users of UrineLuck promotions/newsletter. Password and Password Confirmation are highly necessary because the user will keep their account secured using their own personally created encrypted password. The Password conformation is vital because often in creating accounts you miss type the password the first time and forever are unable to log in. Also the password field will display black bullets instead of the characters themselves to help maintain privacy. The user will be given the option of identifying themselves as a male or female. Admin’s will be created by system engineers through the console. 

Given that all the fields have correct info, when I click “sign up” an account should be created with those credentials. The credentials will successfully be stored in the database for later access by other functions. The user will be routed to the profile page.

Given that the fields have inappropriate info, when I click “sign up” an account should not be created and an error should be displayed saying what fields are incorrect. This error will display how many errors the user has made in creation of their account. Error messages that are displayed include “Name can’t be blank”, “Role can’t be blank” and “Password is too short” among many others. The fields specifically themselves should include Names of any type (we don’t judge), Email’s with proper email formatting and Passwords that are at least 6 characters long.

Upon signing up when the user clicks “create my account” a notification should tell user that they have successfully signed up. 
Testing will be done to see if it works when all fields are filled out. However, we will also test for when the user does not properly fill in the fields. Including but not limited to, if 'password' has a length too short what happens, if 'user' is assigned admin what happens, if 'role' is left unassigned what happens, if 'email' format is incorrect what happens, if 'email' is not unique what happens, if an invalid 'form' is submitted, if 'password' fields are not matching, and if 'name' is missing.

#### Story 3: Profile
As a user it is important that I can see my information is displayed accordingly to my account. Initially, what I want to see displayed as a regular user (regardless of gender) is my Name, Email and Role. This will help me identify my information later as the app progresses and you would like to use your account to add bathrooms, make a review and/or display your name on the leaderboard. 

If user is an admin than they will be able to see all other users that have created an account in their personal profile page. Their credentials will be bolded to help distinguish between other regular accounts. In future iterations these admin users will be able to delete regular users from this screen and will also be able to promote regular users to admins from this screen.

It is also important that the admin's information is bolded as they may wish to see their account details to access the app features which were specified earlier.

Testing will be used to check if proper info is displayed for the regular user account and to see if proper info is displayed for the admin user account.

#### Story 4: Editing Users
As the developer of UrineLuck, it is important to ensure the confidentiality of user information and improve user experience. In future iterations, Admin account and regular user account will be distinguished to make sure only admins can review, edit or delete user information, and users' accounts won’t be accidentally deleted or edited by some random person.

## PLANNED FOR FUTURE ITERATIONS

·As an administrator I want the same abilities as a user. (1/2)

·As a user I want to find public bathrooms nearby. (2)

·As a user I want to find the address of a bathroom. (2)

·As an administrator I want to be able to ban certain users. (2)

·As an administrator I want to modify/remove inappropriate entries. (2)

·As a user I want to upload my bathroom so that other users can find it. (2)

·As an administrator I want to be able to look at every registered user. (2)

·As a user I want to find the bathroom on a map. (3)

·As a user I want to be able to rate different bathrooms. (3)

·As a user I want to be able to search for different bathrooms. (3)

·As a user I want to upload pictures of my bathroom for other users to look at. (3)

·As a user I want to leave comments about the bathrooms so that other users can be more informed. (3)







### Planned Layout

github.com/cmptgroup-13/class-project/tree/master/Draft_For_Site_Design
