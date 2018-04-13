When /^(?:|I )search for "([^"]*)" in "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
  click_button(Search)
end