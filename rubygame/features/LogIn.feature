Feature: Go to Log In Page

  Scenario: Click on Log In link to go to Log In Page
    Given I am on the RubyGG home page
    When I follow "Log in"
    Then I should be on the Log In page
    
    
  Scenario: Click on I have an account button to go to Log In Page
    Given I am on the Sign Up page
    When I follow "I have an account"
    Then I should be on the Log In page
    
  Scenario: Go back to Home Page
    Given I am on the Log In page
    When I follow "Home"
    Then I should be on the RubyGG home page
    
    
  Scenario: Successful log in
    Given I have created an account
    When I fill in "email" with "test@testing.com"
    When I fill in "password" with "test"
    When I press "Log in"
    Then I should be on the RubyGG home page
    
  Scenario: Incorrect email and/or password
    Given I have created an account
    When I fill in "email" with ""
    When I fill in "password" with ""
    When I press "Log in"
    Then I should be on the Log In page