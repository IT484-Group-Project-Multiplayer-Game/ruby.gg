Given("I am in the Sign Up page") do
  pending # Write code here that turns the phrase above into concrete actions
  Given "a valid user"
  visit signin_url
  fill_in "Email", :with => "brhane@gmail.com"
  fill_in "Password", :with => "a"
  fill_in "Password confirmation", :with => "a"
  click_button "Create User"
end

When("I should be in smmoners page") do
  pending # Write code here that turns the phrase above into concrete actions
end
Given /^a valid user$/ do
  @user = User.create!({
             :email => "brhane@gmail.com",
             :password => "a",
             :password_confirmation => "a"
           })
end

Given /^a logged in user$/ do
  Given "a valid user"
  visit signin_url
  fill_in "Email", :with => "brhane@gmail.com"
  fill_in "Password", :with => "a"
  click_button "Log in"
end
