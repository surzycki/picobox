@acceptance
Feature: Uninstalled warnings
  Background:
    Given the test environment is setup
    And I am using a darwin OS


  Scenario: Picobox cannot list boxes when uninstalled
    Given I run `picobox boxes`
    Then the output should match:
      """
        Picobox not installed!
        Run: picobox install
      """


  Scenario: Picobox cannot list services when uninstalled
    Given I run `picobox service list`
    Then the output should match:
      """
        Picobox not installed!
        Run: picobox install
      """


  Scenario: Picobox cannot init project when uninstalled
    Given I run `picobox init rails`
    Then the output should match:
      """
        Picobox not installed!
        Run: picobox install
      """


  Scenario: Picobox cannot be uninstalled when not installed in the first place
    Given I run `picobox uninstall`
    Then the output should match:
      """
        Picobox not installed!
        Run: picobox install
      """