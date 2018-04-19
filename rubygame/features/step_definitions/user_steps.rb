Given /^I am in the Sign Up page$/ do

end
When /^(?:|I )fill in the following:$/ do |value, field|
  #fill_in field.to_sym, :with => value
  fill_in(field, :with => value)
  click_button("Create User")
end


Then /I should be in smmoners page/ do
    visit users_path
end


#the code below should be for login

When("I provide in the {string} and {string}") do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

When("I provide in the following:") do |table|
  #table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
  fill_in "Email", :with => "brh@gmail.com"
  fill_in "Password", :with => "a"
  click_button("Log in")
end

Given /^a valid user$/ do
  @user = User.create!({
             :email => "brh@gmail.com",
             :password => "a",
             #:password_confirmation => "a"
           })
end






































#Given("I am in the Sign Up page") do
 # pending # Write code here that turns the phrase above into concrete actions
  #Given "a valid user"
  #visit signin_url
  #fill_in "Email", :with => "brh@gmail.com"
  #fill_in "Password", :with => "a"
  #fill_in "Password confirmation", :with => "a"
  #click_button "Create User"
#end





#Given /^a logged in user$/ do
 #Given "a valid user"
  #visit signin_url
  #fill_in "Email", :with => "brhane@gmail.com"
  #fill_in "Password", :with => "a"
  #click_button "Log in"
#end
