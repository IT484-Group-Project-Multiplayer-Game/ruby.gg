Feature: Search for a summoner by the summoner's name

  Background: Start from home page
    Given I am on the RubyGG home page

  Scenario: Search without an input (sad path)
    When I fill in "search" with ""
    And I press "Search"
    #    When I search for "" in "search"
    Then I should be on the RubyGG home page

  Scenario: Search for hideinbush (happy path)
    When I fill in "search" with "hideinbush"
    And I press "Search"
    Then I should be on hideinbush summoner page