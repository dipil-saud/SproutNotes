Feature: Manage user_logins


  Scenario: Register new user_login
    Given I am not authenticated
    And I am on the root page
    And I have one user "a@b.com" with password "123456"
    When I follow "Sign In"
    And I fill in "Email" with "a@b.com"
    And I fill in "Password" with "123456"
    And I press "Sign in"
    Then I should see "Signed in successfully"
    And I should see "a@b.com"



