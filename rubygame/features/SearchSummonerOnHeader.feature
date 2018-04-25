Feature: Search for a summoner by the summoner's name on header

  Background: Start from a page not the landing page
    Given I am on the login page

  Scenario: Search without an input (sad path) on header
    When I search for "" at "search"
    Then I should be on the RubyGG home page
    And I should see "Please enter a summoner name"

  Scenario: Search for hideinbush (happy path) on header
    When I search for "hideinbush" at "search"
    Then I should be on "hideinbush"'s summoner page
    And I should see "hideinbush"