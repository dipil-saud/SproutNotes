Given /^I have question titled "([^"]*)"$/ do |title|
  Question.make({:title => title, :user => User.first}).save
end

Given /^I visit the "([^"]*)" question page$/ do |title|
  question = Question.find_by_title(title)
  visit question_path(question)
end

