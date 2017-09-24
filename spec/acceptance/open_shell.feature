@acceptance
Feature: Open Shell Commands
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed
    And I am in a project directory called 'test'
    And I run `picobox init rails`


  Scenario: Open shell when stopped
    Given the containers have been stopped
    When I run `picobox ssh dev`
    Then the output should match:
      """
        Getting shell
              open  Running dev shell
        Picobox is not running!
      """





