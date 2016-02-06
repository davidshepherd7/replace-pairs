Feature: Do Some things

  Background:
    When the buffer is empty

  Scenario: Replace [ to (
    Given I insert "argle [ hello world ] foo bar "
    When I replace-pairs "[" -> "(" in buffer
    Then I should see "( hello world )"
