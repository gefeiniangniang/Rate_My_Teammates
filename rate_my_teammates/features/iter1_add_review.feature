Feature: find the survey to rate a student

  As a student
  I want to access the review page for that teammate and submit a review
  So that I can rate a past/current teammate

Background: user profile in database

  Given the following users exist:
  | uni        | name             | description | summary     |
  | lc3533     | Charles Chen     | MSCS_2021   | I like AI   |
  | yj2627     | Ari Jiang        | MSCS_2021   | I like ML   |
  | xl2950     | Xijiao Li        | BSCS_2021   | I like OS   |
  | gz2315     | Gefei Zhang      | MSCS_2021   | I like Algo |

  And I log in as "yj2627"

Scenario: find the page to add review for a specific user, and go back to the previous page
  Given I am on the user page for "lc3533"
  Then I should see "Summary"
  When I follow "Add A Review"
  Then I should see "New Review For Charles Chen"
  And I should see "Course Taken Together"
  And I should see "Content"
  When I follow "Back"
  Then I should see "Comments From Previous Teammates"

Scenario: add empty review for a user (sad path)
  Given I am on the user page for "lc3533"
  When I follow "Add A Review"
  And I press "Submit Review"
  Then I should see "Review has no content"
  And I should see "New Review For"
