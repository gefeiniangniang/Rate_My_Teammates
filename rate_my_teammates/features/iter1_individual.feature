Feature: go to a student’s individual page

As a student
I want to see his/her detailed review page
So that I can read detailed reviews about a student I am interested in teaming up with

Background: users in database

  Given the following users exist:
  | uni        | name             | description | summary     |
  | lc3533     | Charles Chen     | MSCS_2021   | I like AI   |
  | yj2627     | Ari Jiang        | MSCS_2021   | I like ML   |
  | xl2950     | Xijiao Li        | BSCS_2021   | I like OS   |
  | gz2315     | Gefei Zhang      | MSCS_2021   | I like Algo |

  And I log in as "yj2627"

Scenario: go to an individual's details page (in this case it's Charles Chen)
  Given I am on the home page
  When I follow "More about Charles Chen"
  Then I should see "Summary"
  And I should see "General Skills"
  And I should see "Other Skills"
  And I should see "Comments From Previous Teammates"
  When I follow "Back To User List"
  Then I should not see "Comments From Previous Teammates"
  But I should see "More about Charles Chen"
