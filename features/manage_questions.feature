Feature: Manage questions
  In order to ask questions
  As a user

  Background:
     Given I have category "Rails"
     And I am authenticated

  Scenario: Register new questions
   Given I am on the user_root page
   And I follow "Ask a Question"
   Then I should see "What's your ??"
   When I fill in "Title" with "My first question"
   And I fill in "Description" with "Description of my question"
   And I select "Rails" from "Category"
   And I press "Create Question"
   Then I should see "My first question"

   @javascript
   Scenario: Remove a previously asked question
    Given I have question titled "How To Train Your Dragon"
    And I visit the "How To Train Your Dragon" question page
    And I disable confirm dialog box
    When I follow "Delete"
    Then I should see "How To Train Your Dragon Successfully Deleted"



