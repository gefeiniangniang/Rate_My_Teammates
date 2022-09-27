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

Scenario: add review for a specific user
  Given I am on the user page for "lc3533"
  When I follow "Add A Review"
  And I fill in "review_course_taken_together" with "4111"
  And I fill in "review_content" with "good at database"
  And I choose "time_management" on "1"
  And I choose "communication" on "1"
  And I choose "critical_thinking" on "1"
  And I choose "collaboration" on "1"
  And I choose "reliability" on "1"
  And I press "Submit Review"
  Then I should be on the user page for "lc3533"
  And I should see "yj2627"
  And I should see "good at database"

Scenario: add empty course for a user (sad path)
  Given I am on the user page for "lc3533"
  When I follow "Add A Review"
  And I fill in "review_content" with "good at database"
  And I choose "time_management" on "1"
  And I choose "communication" on "1"
  And I choose "critical_thinking" on "1"
  And I choose "collaboration" on "1"
  And I choose "reliability" on "1"
  And I press "Submit Review"
  Then I should see "Please enter the course you have taken together"
  And I should see "New Review For"

Scenario: add empty time management review for a user (sad path)
  Given I am on the user page for "lc3533"
  When I follow "Add A Review"
  And I fill in "review_content" with "good at database"
  And I choose "communication" on "1"
  And I choose "critical_thinking" on "1"
  And I choose "collaboration" on "1"
  And I choose "reliability" on "1"
  And I press "Submit Review"
  Then I should see "Please review time management skill"
  And I should see "New Review For"

Scenario: add empty communication review for a user (sad path)
  Given I am on the user page for "lc3533"
  When I follow "Add A Review"
  And I fill in "review_content" with "good at database"
  And I choose "time_management" on "1"
  And I choose "critical_thinking" on "1"
  And I choose "collaboration" on "1"
  And I choose "reliability" on "1"
  And I press "Submit Review"
  Then I should see "Please review communication skill"
  And I should see "New Review For"

Scenario: add empty critical thinking review for a user (sad path)
  Given I am on the user page for "lc3533"
  When I follow "Add A Review"
  And I fill in "review_content" with "good at database"
  And I choose "time_management" on "1"
  And I choose "communication" on "1"
  And I choose "collaboration" on "1"
  And I choose "reliability" on "1"
  And I press "Submit Review"
  Then I should see "Please review critical thinking skill"
  And I should see "New Review For"

Scenario: add empty collaboration review for a user (sad path)
  Given I am on the user page for "lc3533"
  When I follow "Add A Review"
  And I fill in "review_content" with "good at database"
  And I choose "time_management" on "1"
  And I choose "communication" on "1"
  And I choose "critical_thinking" on "1"
  And I choose "reliability" on "1"
  And I press "Submit Review"
  Then I should see "Please review collaboration skill"
  And I should see "New Review For"

Scenario: add empty reliability review for a user (sad path)
  Given I am on the user page for "lc3533"
  When I follow "Add A Review"
  And I fill in "review_content" with "good at database"
  And I choose "time_management" on "1"
  And I choose "communication" on "1"
  And I choose "critical_thinking" on "1"
  And I choose "collaboration" on "1"
  And I press "Submit Review"
  Then I should see "Please review reliability"
  And I should see "New Review For"
