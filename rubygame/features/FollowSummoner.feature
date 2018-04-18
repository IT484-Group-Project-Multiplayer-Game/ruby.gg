Feature: Follow a summoner for quick access

  Scenario: Find and follow a summoner
    Given I am on the RubyGG home page
    When I search for "hideinbush" at "searchFrHome"
    Then I should be on hideinbush's summoner page
    When I follow "Follow"
    Then

  Scenario: View a followed summoner