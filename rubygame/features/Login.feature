Feature:Login to user account
As a user
So that I can fellow player
I want to login to my account

Background: users have created account which is stored in database

Scenario: login
  Given a valid user
  When I go to the login page
  #And I provide in the following:
  And I provide in the "Email" and "password"
    #|Email|Password|
    #|brh@gmail.com|a|
    
  And I press "Log in"
  Then I should be in smmoners page