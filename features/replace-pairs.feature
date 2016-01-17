Feature: Do Some things

  Background:
    When the buffer is empty

  Scenario: Replace [ to (
    Given I insert
    """
    argle [ hello world ] foo bar
    """
    Given I start an action chain
    And I press "M-x"
    And I type "replace-pairs"
    And I execute the action chain
    Then I should see "( hello world )"
