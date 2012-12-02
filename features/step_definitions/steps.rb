When /^I visit to home page$/ do
  visit root_path
end

Then /^I should see "(.*?)"$/ do |text|
  body.should have_content text
end
