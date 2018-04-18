# Not being used atm
When /^(?:|I )search for "([^"]*)" at "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
    click_button("find summoner")
end