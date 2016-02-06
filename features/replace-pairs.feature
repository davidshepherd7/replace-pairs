Feature: Replace pairs

  Background:
    When the buffer is empty

  # Basic
  Scenario: Replace [ to (
    Given I insert "argle [ hello world ] foo bar "
    When I replace-pairs "[" -> "(" in buffer
    Then I should see "( hello world )"

  # Closing parens as inputs
  Scenario: Replace [ to )
    Given I insert "argle [ hello world ] foo bar "
    When I replace-pairs "[" -> ")" in buffer
    Then I should see "( hello world )"

  Scenario: Replace ] to )
    Given I insert "argle [ hello world ] foo bar "
    When I replace-pairs "]" -> ")" in buffer
    Then I should see "( hello world )"

  Scenario: Replace ] to (
    Given I insert "argle [ hello world ] foo bar "
    When I replace-pairs "]" -> "(" in buffer
    Then I should see "( hello world )"


  # Pairs as inputs
  Scenario: Replace [] to (
    Given I insert "argle [ hello world ] foo bar "
    When I replace-pairs "[]" -> ")" in buffer
    Then I should see "( hello world )"

  Scenario: Replace [ to ()
    Given I insert "argle [ hello world ] foo bar "
    When I replace-pairs "[" -> "()" in buffer
    Then I should see "( hello world )"


  Scenario: Adding a new pair
    Given I insert "argle @ hello world ~ foo bar "
    When I add a new pair "@", "~"
    And I replace-pairs "@" -> "{" in buffer
    Then I should see "{ hello world }"

  Scenario: Query replace [ to (
    Given I insert "argle [ hello world ] foo bar "
    When I query-replace-pairs "[" -> ")" in buffer
    Then I should see "( hello world )"
    Then I should not see "!"
