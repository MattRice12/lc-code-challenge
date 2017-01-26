Feature: A User Creates a Vent

  Scenario: A User views an empty page
    When I go to the root path
    Then I should see "Venter"
    And I should see "No on has vented yet today. Be the first!"
    And I should not see "Submitted"

  Scenario: A User Creates a Vent
    When I go to the root path
    And I fill in "vent[text]" with "Hi there!"
    And I press "Post"
    Then I should see "Hi there!"
    And I should see "Submitted less than a minute ago."

  Scenario: A User Submits Blank Vent
    When I go to the root path
    And I press "Post"
    Then I should see "Text can't be blank"
    And I should see "Text is too short (minimum is 5 characters)"
    And I should not see "Submitted less than a minute ago."

  Scenario: A User Submits Too-Short Vent
    When I go to the root path
    And I fill in "vent[text]" with "No"
    And I press "Post"
    And I should see "Text is too short (minimum is 5 characters)"
    And I should not see "Submitted less than a minute ago."

  Scenario: A User Submits Too-Long Vent
    When I go to the root path
    And I overfill "vent[text]"
    And I press "Post"
    And I should see "Text is too long (maximum is 500 characters)"
    And I should not see "Submitted less than a minute ago."
