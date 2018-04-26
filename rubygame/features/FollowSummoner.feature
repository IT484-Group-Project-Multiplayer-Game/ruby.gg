Feature: Favorite a summoner for quick access

  Scenario: Find and attempt to favorite a summoner when not logged in
    Given I am on the RubyGG home page
    When I search for and favorite "saemi"
    And I should see "Please log in to add summoner saemi into Favorites"

  Scenario: Find and favorite a summoner when logged in
    Given I have created an account
    Given I have logged in
    When I search for and favorite "saemi"
    And I should see "Successfully added summoner saemi into Favorites"

  Scenario: View a favorite summoner
    Given I have created an account
    Given I have logged in
    When I search for and favorite "saemi"
    And I should see "Successfully added summoner saemi into Favorites"

    When I follow "Favorites"
    Then I should be on my favorite summoners page
    Then I should see "Favorite Summoners"
    When I follow "Show summoner saemi"
    Then I should be on "saemi"'s summoner page
    And I should see "saemi"