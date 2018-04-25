Feature: Search for a summoner by the summoner's name on landing page

  Background: Start from home page
    Given I am on the RubyGG home page

  Scenario: Search without an input (sad path) on index page
    When I search for "" at "searchFrHome"
    Then I should be on the RubyGG home page
    And I should see "Please enter a summoner name"

  Scenario: Search for hideinbush (happy path) on index page
    When I search for "hideinbush" at "searchFrHome"
    Then I should be on "hideinbush"'s summoner page
    And I should see "hideinbush"