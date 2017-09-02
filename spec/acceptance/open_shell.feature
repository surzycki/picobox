@acceptance
Feature: Open Shell Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed
    And I run `picobox init rails`


  Scenario: Open shell when stopped
    Given the containers have been stopped
    When I run `picobox open dev`
    Then the output should match:
      """
        Getting shell
              open  Running dev shell
        Picobox is not running!
      """


  Scenario: Opening shell when no project initialize
    Given the directory ".picobox" does not exist
    When I run `picobox open dev`
    Then the output should match:
      """
        Getting shell
              open  Running dev shell
             error  no project found
        Run command in a project directory or create new project with
      """


