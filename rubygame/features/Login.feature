Feature:Login 
        As a user
        In order to get access to the application
        I want to log in
        
Background: users have created account which is stored in database

Scenario: Login
  Given I am in the Login page
  When click_in  "I AM NEW USER"
  And fill_in "email" with "brh@gmail.com "
  And fill_in "password" with "a"
  And I click_in "LOG IN"
  Then I should be in the summoners page 
  
Scenario: Login invalid with password missing or wrong password
  Given I am in the Login page
  When click_in  "I AM NEW USER"
  And fill_in "email" with "brh@gmail.com "
  And fill_in "password" with " "
  And I click_in "LOG IN"
  Then I should be in the login page
  
Scenario: Login invalid with email missing or wrong email
  Given I am in the Login page
  When click_in  "I AM NEW USER"
  And fill_in "email" with " "
  And fill_in "password" with " "
  And I click_in "LOG IN"
  Then I should be in the login page
  
