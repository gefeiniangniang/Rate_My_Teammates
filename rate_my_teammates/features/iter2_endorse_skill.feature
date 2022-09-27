Feature: add a skill for a student
  As a student
  I want to add a skill tag for other students or for myself
  So that people can know everybody's skills clearly

Background: users profile in database

  Given the following users exist:
  | uni        | name             | description | summary     |
  | lc3533     | Charles Chen     | MSCS_2021   | I like AI   |
  | yj2627     | Ari Jiang        | MSCS_2021   | I like ML   |
  | xl2950     | Xijiao Li        | BSCS_2021   | I like OS   |
  | gz2315     | Gefei Zhang      | MSCS_2021   | I like Algo |

  And user "lc3533" has skill "Java"

  Given I log in as "yj2627"
  And I am on the user page for "lc3533"

Scenario: endorse a skill for the user
  Then I should see "Other Skills"
  And I should see "Java"
  And I should see "0 Endorsement"
  Then I press "Endorse"
  And I should see "1 Endorsement"
  Then I press "Endorse"
  And I should see "You can't endorse more than once for the same skill"
  And I should see "1 Endorsement"
  And  I should be on the user page for "lc3533"
