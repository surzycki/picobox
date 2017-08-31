@acceptance
Feature: CLI Commands
  Background:
    Given a mocked home directory

  Scenario: Adding service to un-inialized project
    And I run `picobox add postgres`
    Then the output should match:
      """
      """