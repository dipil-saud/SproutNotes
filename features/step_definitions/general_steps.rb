When /^I sleep for (\d+) seconds$/ do |duration|
  sleep(duration.to_i)
end

Given /^I have category "([^"]*)"$/ do |title|
  Category.create({:name => title})
  puts Category.first.name
end

Given /^I have how_to "([^"]*)"$/ do |title|
  HowTo.make({:title => title, :user => User.first}).save
end

Given /^I visit the how_to "([^"]*)" page$/ do |title|
  how_to = HowTo.find_by_title(title)
  visit how_to_path(how_to)
end

Given /^I disable confirm dialog box$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
end



