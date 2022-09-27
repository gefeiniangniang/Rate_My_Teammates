@javascript
Feature: edit user profile
  As a student
  I want to be able to edit my profile while logged in
  So that I can ensure my information on the website is accurate

Background: users profile in database

  Given the following users exist:
  | uni        | name             | description | summary     |
  | lc3533     | Charles Chen     | MSCS_2021   | I like AI   |
  | yj2627     | Ari Jiang        | MSCS_2021   | I like ML   |
  | xl2950     | Xijiao Li        | BSCS_2021   | I like OS   |
  | gz2315     | Gefei Zhang      | MSCS_2021   | I like Algo |

  Given I log in as "yj2627"
  And I am on the user page for "yj2627"

Scenario: user edits program information
  Then I should not see "I like Python"
  When I edit bip "#edit3_yj2627"
  Then I should see "I like Python"
