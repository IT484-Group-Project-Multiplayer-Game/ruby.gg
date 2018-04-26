Feature: User can signup
As a user 
So that I Can fellow a  player 
I want to create account

Scenario: create an account with emil missing
  Given I am in the Sign Up page
  When click_in  "I AM NEW USER"
  And fill_in "email" with "brh@gmail.com "
  And fill_in "password" with "a"
  And fill_in "password_confirmation" with "a"
  And I click_in "Create User"
  Then I should be in the signup page 
  
  
Scenario: create an account with email missing
  Given I am in the Sign Up page
  When click_in  "I AM NEW USER"
  And fill_in "email" with ""
  And fill_in "password" with "a"
  And fill_in "password_confirmation" with "a"
  And I click_in "Create User"
  Then I should be in the signup page 
  And I should see form is invalid
  
Scenario: create an account with password mismatch
  Given I am in the Sign Up page
  When click_in  "I AM NEW USER"
  And fill_in "email" with "brh@gmail.com "
  And fill_in "password" with "a"
  And fill_in "password_confirmation" with "b"
  And I click_in "Create User"
  Then I should be in the signup page 
  
  
  