Feature: History

  In order to check if and how a Test Double has been called
  As a BDD-guy
  I want to have all calls to Test Doubles logged into a History

  Scenario: Check history
    Given I double `foo --bar baz`
    Then the double `foo --bar baz` should not have been run
    When I run `foo --bar baz`
    Then the double `foo --bar baz` should have been run
    But the double `foo` should not have been run

  Scenario: Clean history after each scenario
    Then the double `foo --bar baz` should not have been run
