Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  User.new(:email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'a@a.com'
  password = '123456'

  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I am authenticated$/ do
 user = User.make({:password => "123456",:password_confirmation => "123456"})
 user.save
 And %{I am on the root page}
 When %{I follow "Sign In"}
 And %{I fill in "Email" with "#{User.first.email}"}
 And %{I fill in "Password" with "123456"}
 And %{I press "Sign in"}
end
