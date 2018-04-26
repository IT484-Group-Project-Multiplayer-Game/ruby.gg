Feature: Go to Sign Up Page from Log In Page

  Scenario: Click on I am A New User button to go to Sign Up Page
    Given I am on the Log In page
    When I follow "I am a new user"
    Then I should be on the Sign Up page
    
  Scenario: Go back to Home Page
    Given I am on the Sign Up page
    When I follow "Home"
    Then I should be on the RubyGG home page
    
  Scenario: Create User
    Given I am on the Sign Up page
    When I fill in "user[email]" with "test@testing.com"
    When I fill in "user[password]" with "test"
    When I fill in "user[password_confirmation]" with "test"
    When I press "Create account"
    Then I should be on the Log In page

  Scenario: Invalid when fields empty
    Given I am on the Sign Up page
    When I fill in "user[email]" with ""
    When I fill in "user[password]" with ""
    When I fill in "user[password_confirmation]" with ""
    When I press "Create account"
    Then I should be on the Sign Up page