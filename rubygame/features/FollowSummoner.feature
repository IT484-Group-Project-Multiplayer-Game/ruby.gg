Feature: Favorite a summoner for quick access

  Scenario: Find and attempt to favorite a summoner when not logged in
    Given I am on the RubyGG home page
    When I search for and favorite "hideinbush"
    And I should see "Please log in to add summoner hideinbush into Favorites"

  Scenario: Find and favorite a summoner when logged in
    Given I have created an account
    Given I have logged in
    When I search for and favorite "hideinbush"
    And I should see "Successfully added summoner hideinbush into Favorites"

  Scenario: View a favorite summoner
    Given I have created an account
    Given I have logged in
    When I search for and favorite "hideinbush"
    And I should see "Successfully added summoner hideinbush into Favorites"

    When I follow "Favorites"
    Then I should be on my favorite summoners page
    Then I should see "Favorite Summoners"
    When I follow "Show summoner hideinbush"
    Then I should be on "hideinbush"'s summoner page
    And I should see "hideinbush"