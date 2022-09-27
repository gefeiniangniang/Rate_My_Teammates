Feature: Search for a person with UNI

  As a student
  I want to see students matching only my search criteria
  So that I can search for specific people I am interested in teaming up with

Background: users in database

  Given the following users exist:
  | uni        | name             | description | summary     |
  | lc3533     | Charles Chen     | MSCS_2021   | I like AI   |
  | yj2627     | Ari Jiang        | MSCS_2021   | I like ML   |
  | xl2950     | Xijiao Li        | BSCS_2021   | I like OS   |
  | gz2315     | Gefei Zhang      | MSCS_2021   | I like Algo |
  And I log in as "lc3533"

Scenario: search for a specific user by UNI
  Given I am on the home page
  When I fill in "uni" with "yj2627"
  And I press "Search"
  Then I should see "Ari Jiang"
  And I should see "MSCS_2021"
  And I should see "yj2627"

Scenario: can't find other users when searching for a specific user
  Given I am on the home page
  When I fill in "uni" with "xl2950"
  And I press "Search"
  Then I should not see "Gefei Zhang"
  And I should not see "gz2315"

Scenario: input UNI that is not in the database and trigger an alert (sad path)
  Given I am on the home page
  When I fill in "uni" with "ml1234"
  And I press "Search"
  Then I should see "UNI not in record."
  And I should not see all the students

Scenario: press search bar with empty input and trigger an alert(sad path)
  Given I am on the home page
  When I press "Search"
  Then I should see "No UNI entered."
  And I should see all the students
