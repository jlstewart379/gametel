@ios
Feature: Interacting with screen elements

  Background:
    Given I am on the home screen

  Scenario: Finding text on a screen
    Then I can see the text "iOS Demo"

  Scenario: Adding text to a text field
    When I enter "Automated" into the field marked "text"
    Then I can see the text "Automated"

  Scenario: Pressing a button
    When I press the button marked "demo"
    Then I am on the button screen