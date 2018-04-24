Feature:challenge1 information 
        As a user
        In to see challenger further information
        I want want to clikc challenger
        
Background: challenger is live from online

Scenario: challenger information
  Given I am in summoners page
  When click_in  "CHALLENGER1"
  Then I should be in summers information page
  And  I should see following logo