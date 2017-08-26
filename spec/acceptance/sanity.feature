
Feature: Sanity
  Scenario: Picobox has a version
    Given I run `picobox version`
    Then the output should contain "0.1.0"