Feature: Search for a summoner by the summoner's name

  Background: Start from home page
    Given I am on the RubyGG home page

  Scenario: Search without an input (sad path)
    When I search for "" at "searchFrHome"
    Then I should be on the RubyGG home page

  Scenario: Search for hideinbush (happy path)
    When I search for "hideinbush" at "searchFrHome"
    Then I should be on hideinbush's summoner page
    And I should see "hideinbush"