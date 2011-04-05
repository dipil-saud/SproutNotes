Given /^the following user_logins:$/ do |user_logins|
  UserLogin.create!(user_logins.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) user_login$/ do |pos|
  visit user_logins_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following user_logins:$/ do |expected_user_logins_table|
  expected_user_logins_table.diff!(tableish('table tr', 'td,th'))
end
