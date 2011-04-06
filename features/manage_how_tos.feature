Feature: Manage how_tos

  Background:
    Given I have category "Rails"
    And I am authenticated

  Scenario: Register new how_to
    When I am on the new_how_to page
    And I fill in "Title" with "Testing cucumber"
    And I fill in "Description" with "Description for testing"
    And I fill in "Instructions" with "Step1:Go to step2 Step2:Go to step1"
    And I select "Rails" from "Category"
    And I press "Create How to"
    Then I should see "Testing cucumber"

    Scenario: Edit how_to
     Given I have how_to "Testing rails"
     And I visit the how_to "Testing rails" page
     When I follow "Edit"
     And I fill in "Title" with "Test in Rspec"
     And I press "Update How to"
     Then I should see "Test in Rspec"

     @javascript
     Scenario: Destroy how_to
      Given I have how_to "Testing rails"
      And I visit the how_to "Testing rails" page
      And I disable confirm dialog box
      When I follow "Delete"
      Then I should see "Testing rails Successfully Deleted"





