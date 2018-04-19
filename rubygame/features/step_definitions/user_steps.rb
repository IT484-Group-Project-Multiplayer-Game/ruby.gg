Given /^I am in the Sign Up page$/ do
 
end
When /^(?:|I )fill in the following:$/ do |e1,e2|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{Email}" with "#{brh@gmail.com}"}
  end
end


When("I should be in smmoners page") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then /I should be in smmoners page/ do
  # Make sure that all the movies in the app are visible in the table
  #fail "Unimplemented"
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
