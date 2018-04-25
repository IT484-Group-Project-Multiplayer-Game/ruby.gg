Feature: View more information of a summoner by clicking on the summoner card

  Scenario: View a summoner
    Given I am on the RubyGG home page
    When I follow "Show summoner TSM Zven"
    Then I should be on "TSM Zven"'s summoner page
    And I should see "TSM Zven"