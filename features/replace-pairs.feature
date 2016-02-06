Feature: Do Some things

  Background:
    When the buffer is empty

  Scenario: Replace [ to (
    Given I insert "argle [ hello world ] foo bar "
    Given I go to point "0"
    Given I start an action chain
    And I press "<menu>"
    And I type "replace-pairs"
    And I press "<return>"
    And I press "["
    And I press "<return>"
    And I press "("
    And I press "<return>"
    And I press "!"
    And I execute the action chain
    Then I should see "( hello world )"
