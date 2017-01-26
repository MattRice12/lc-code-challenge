When(/^I go to the root path$/) do
  visit root_path
end

When(/^I click "([^"]*)"$/) do |link|
  click_link(link)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in(field, with: content)
end

When(/^I overfill "([^"]*)"$/) do |field|
  fill_in(field, with: ("a" * 501))
end

When(/^I press "([^"]*)"$/) do |name|
  click_button(name)
end

When(/^I visit "([^"]*)"$/) do |url|
  visit url
end

When(/^I find "([^"]*)"$/) do |id|
  page.find(id).click
end

Then(/^I should see "([^"]*)"$/) do |content|
  assert page.has_content?(content)
end

Then(/^I should not see "([^"]*)"$/) do |content|
  refute page.has_content?(content)
end

When(/^I debug$/) do
  puts page.html
  # binding.pry
end
