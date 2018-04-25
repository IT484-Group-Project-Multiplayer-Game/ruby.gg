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
    
    
  Scenario: Fill in email and password and log in
    Given I am on the Log In page
    When I fill in "email" with "rashad.khan@mnsu.edu"
    When I fill in "password" with "test"
    When I press "Log in"
    Then I should be on the RubyGG home page