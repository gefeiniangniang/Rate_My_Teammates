Feature: log in and log out as a user
  As a student
  I want to log in and log out to the website
  So that I can edit my information and rate others
  
Background: users profile in database

  Given the following users exist:
  | uni        | name             | description | summary     |
  | lc3533     | Charles Chen     | MSCS_2021   | I like AI   |
  | yj2627     | Ari Jiang        | MSCS_2021   | I like ML   |
  | xl2950     | Xijiao Li        | BSCS_2021   | I like OS   |
  | gz2315     | Gefei Zhang      | MSCS_2021   | I like Algo |
  
Scenario: get a verification email when signing in with correct uni, when sending a verification email again, token updates
  Given I am on the home page
  And I follow "Sign In"
  And I fill in "uni" with "yj2627"
  And I press "Sign In"
  Then I should see "Verification sent to yj2627@columbia.edu. Please login via the sent link."
  And I should see all the students
  Then I follow "Sign In"
  And I fill in "uni" with "yj2627"
  And I press "Sign In"
  Then I should see "Verification sent to yj2627@columbia.edu. Please login via the sent link."
  And I should see all the students
  
Scenario: get error message when signing in with empty input
  Given I am on the home page
  And I follow "Sign In"
  And I fill in "uni" with ""
  And I press "Sign In"
  Then I should see "Please enter your UNI."
  
Scenario: log out
  Given I log in as "yj2627"
  And I am on the home page
  And I follow "Sign Out"
  Then I should see "Logged out!"
  
#Scenario: try to log in after logging in
#  Given I am on the login page
#  And "yj2627" logged on for the current session
#  And I press "Sign In"
#  Then I should be on the home page
# Deleted redundent check in sesseion controller 
 
Scenario: token expired or nil
  Given "yj2627" token expired
  And I am on the auth page
  Then I should see "Your login link has been expired. Try requesting for a new login link."
  
Scenario: user authenticated, profile created
  Given I just logged in as "yj2527"
  Then I should see "We have just created your data! Please fill in your name to start."


