Project by: Dallan Bhatti, Alex Nguyen, Dawson Perron, Dylan Wang, Yolanda Yao

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


## User Stories

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

As the user of UrineLuck, I wish I will be able to edit my own profile such as name, email and password. Letting users change and update their profile is important because user information may change over time. For example, users’ emails should be always up to date as they need email to reset password. In future iterations, users will be given the option to edit their own profile when logging in.

Testing will be done to ensure only admins can be able to edit their own info and regular users can be able to edit their own information.

#### Story 5: Uploading Bathrooms
As a user of UrineLuck, it is important that I will be able to submit bathrooms to the application so that other users can look for my submission. In my submission I would like to be able to specify the location of the bathroom and be able to assign a rating.

On the form there is a dropdown selection for "Country" and "Province/State". There is a blank textbox for "City","Address", "Apartment number" and a number field for "Rating".

Given that all the fields are given values that satisfy the parameters, a request to add the bathroom should be sent to the database so that an admin can later review the request and decide to add the bathroom. This bathroom should not be visisible to the public until approved by an admin.

Given that all the fields are not given correct values that satisfy the parameters a new bathroom should not be requested to the admin when "Create my bathroom" is pushed and instead an error appears on the page saying what fields containt incorrect values.

Address can't be blank. The number rating must be between 0-5. The entry must also not already exist in the database. The entry must also exist somewhere in the Country specified.

As an admin I want to be able to approve or deny requests so that user submissions can be viewed or not viewed pubicly by other users. Given that I want to add the bathroom, when I fill the checkbox next to add bathroom and click submit, the bathroom should be added so that other users can see it and the request no longer appears on the requests page. Given that I do not want add the bathroom to the database, when I click destroy the request should no longer appear on the request page and it is removed from the database.

In future iterations this could include descriptions along side location and rating.

Testing will be done so that only legitimate entries are added to the database with appropriate values using the above parameters.

We test for uniqueness in addresses, and we test to see if the latitude and longitude is within the bounds of north america.

####Story 6: Looking at bathrooms
As a user I want to find public bathrooms in the database so that I can determine how close they are and what the quality of the bathroom is.

As a user I want to see the different bathrooms I added to the database and leave or view reviews on them. Given that I click "show all baths" all the different bathrooms that have been added to the database should appear.

Given that I click "Leave a Review" I should be taken to a form where I can type a comment and submit it.

Given that I click "View" I should be taken to a page that displays the address, rating, a map that shows the location of the bathroom, and all the reviews for that bathroom plus a link to leave a review.

As a user I want to be able to find the closest bathrooms near me. Given that I enter nearby address on the home page and click submit, I should be taken to a page with a list of bathrooms within a certain amount of kilometres. If the address entered is a nonexistent address, an error should be returned saying the address entered does not exist.

Given that I am an admin when I click "see all bathrooms" I should be able to see all the different bathrooms in the database with added attributes of "latitude", "longitude" and "bath id". I should also be able to remove entries from this page by clicking destory.

For testing devise makes sure that entries are not blank and we make sure the amount of characters entered does not go above a certain number.


####Story 7: Modifying user priviledges
As an administrator I want to be able to see each user that has signed up with an account.
Given that I select "view users in database" a list of users should show up.

As an administrator I want to be able to ban users from using our application to prevent misuse.
Given that I select "destroy" the user should be removed from the database making them unable to login. Before this a notification should rise to ask for confirmation of deletion.

For testing the devise gem ensures proper management.


####Story 8: Reviews
As a user I want to be able to look at reviews for a bathroom so that I can see other users opinions. When I click "view" a list of reviews should show up on the bathroom page below the map.

When I click leave a review I should be taken to a form where I can type a review and submit it to be viewed whenever other users view the page for that specific bathroom. If the review is blank or the review exceeds the maximum amount of characters, the review should not be submitted to the database and an error should be returned saying what the error was.

As an admin I should be able to destory reviews. Given that I am on the view page, beside each review there should be a link to destroy the review which will remove the review from the databse when clicked on. A notification should pop up asking for confirmation to delete the review. If confirmed it should be deleted if not it should stay.

For testing the devise gem comes with its own tests to make sure entries are removed and uploaded.




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

