When /^(?:|I )search for "([^"]*)" at "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
    click_button("find summoner")
end

Given /^(?:|I )I have created an account$/ do
    steps %Q{
        Given I am on the Log In page
        When I follow "I am a new user"
        When I fill in "user[email]" with "test@testing.com"
        And I fill in "user[password]" with "test"
        And I fill in "user[password_confirmation]" with "test"
        And I press "Create account"
        Then I should be on the Log In page
    }
end

Given /^(?:|I )I have logged in$/ do
    steps %Q{
        Given I am on the Log In page
        When I fill in "email" with "test@testing.com"
        And I fill in "password" with "test"
        And I press "Log in"
        Then I should be on the RubyGG home page
        And I should see "You are successfully logged in!"
    }
end

When /^(?:|I )I search for and favorite "([^"]*)"$/ do |summoner|
    steps %Q{
        When I search for "#{summoner}" at "searchFrHome"
        Then I should be on "#{summoner}"'s summoner page
        When I follow "star"
        Then I should be on "#{summoner}"'s summoner page
    }
end