Feature: Define Output

  In order to double a command line application
  As a BDD-guy
  I want to define the doubles output

  Scenario: Double with default stdout, stderr and exit status
    Given I double `foo --bar baz`
    When I run `foo --bar baz`
    Then the exit status should be 0
    And the stdout should be empty
    And the stderr should be empty

  Scenario: Double with custom stdout (inline)
    Given I double `foo` with "hello, world."
    When I run `foo`
    Then the exit status should be 0
    And the stdout should contain "hello, world."
    And the stderr should be empty

  Scenario: Double with custom stdout
    Given I double `foo --bar baz` with stdout:
      """
      hello, world.
      """
    When I run `foo --bar baz`
    Then the exit status should be 0
    And the stdout should contain exactly:
      """
      hello, world.

      """
    And the stderr should be empty

  Scenario: Double with custom stdout and exit status
    Given I double `foo --bar baz` with exit status 42 and stdout:
      """
      hello, world.
      """
    When I run `foo --bar baz`
    Then the exit status should be 42
    And the stdout should contain exactly:
      """
      hello, world.

      """
    And the stderr should be empty

  Scenario: Double with custom stderr
    Given I double `foo --bar baz` with stderr:
      """
      BOOOOOOOM!!!
      """
    When I run `foo --bar baz`
    Then the exit status should be 0
    And the stdout should be empty
    And the stderr should contain exactly:
      """
      BOOOOOOOM!!!

      """

  Scenario: Double with custom stderr and exit status
    Given I double `foo --bar baz` with exit status 42 and stderr:
      """
      BOOOOOOOM!!!
      """
    When I run `foo --bar baz`
    Then the exit status should be 42
    And the stdout should be empty
    And the stderr should contain exactly:
      """
      BOOOOOOOM!!!

      """

  Scenario: Double with custom exit status
    Given I double `foo --bar baz` with exit status 42
    When I run `foo --bar baz`
    Then the exit status should be 42
    And the stdout should be empty
    And the stderr should be empty

  Scenario: Double called with unknown arguments
    Given I double `foo --bar baz` with exit status 42 and stdout:
      """
      hello, world.
      """
    When I run `foo --unknown arguments`
    Then the exit status should be 0
    And the stdout should be empty
    And the stderr should be empty

  Scenario: Double with multiple outputs
    Given I double `foo --hello` with "hello, world."
    And I double `foo --hello --loud` with "HELLO, WORLD!"
    When I run `foo --hello`
    Then the stdout should contain "hello, world."
    But the stdout should not contain "HELLO, WORLD!"
    When I run `foo --hello --loud`
    Then the stdout should contain "HELLO, WORLD!"
