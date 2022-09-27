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

Scenario: add a skill for the user
  Given I log in as "yj2627"
  And I am on the user page for "lc3533"
  Then I should see "Other Skills"
  When I follow "Add A Skill"
  Then I should see "New Skill For Charles Chen"
  And I fill in "skill_name" with "Java"
  And I press "Add Skill"
  Then I should be on the user page for "lc3533"
  And I should see "Java"

Scenario: add an empty skill for the user
  Given I log in as "yj2627"
  And I am on the user page for "lc3533"
  Then I should see "Other Skills"
  When I follow "Add A Skill"
  Then I should see "New Skill For Charles Chen"
  And I fill in "skill_name" with ""
  And I press "Add Skill"
  Then I should see "Skill name cannot be empty"
  And I should see "New Skill For Charles Chen"

  Scenario: add an empty skill for the user
    Given I am on the user page for "lc3533"
    And I add a new review for user "lc3533"
    Then I should see "You have no access to add reviews"
