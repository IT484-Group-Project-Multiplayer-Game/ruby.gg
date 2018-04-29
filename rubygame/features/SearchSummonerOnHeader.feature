Feature: Search for a summoner by the summoner's name on header

  Background: Start from a page not the landing page
    Given I am on the Log In page

  Scenario: Search without an input (sad path) on header
    When I search for "" at "search"
    Then I should be on the RubyGG home page
    And I should see "Please enter a summoner name"

  Scenario: Search for nonexistent (sad path) on header
    When I search for "sdflaksjf" at "search"
    Then I should be on the RubyGG home page
    And I should see "Summoner does not exist"

  Scenario: Search for saemi (happy path) on header
    When I search for "saemi" at "search"
    Then I should be on "saemi"'s summoner page
    And I should see "saemi"