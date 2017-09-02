@acceptance
Feature: Stop Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed
    And I run `picobox init rails`


  Scenario: Stopping system
    Given the containers have been started
    When I run `picobox stop`
    Then the output should match:
      """
        Picobox stopping...
        Picobox stopped!
      """


  Scenario: Stopping system (one service down)
    Given there are stopped and started containers
    When I run `picobox stop`
    Then the output should match:
      """
        Picobox stopping...
        Picobox stopped!
      """


  Scenario: Stopping system when no project intialized
    Given the directory ".picobox" does not exist
    When I run `picobox stop`
    Then the output should match:
      """
        Picobox stopping...
             error  no project found
        Run command in a project directory or create new project with
      """


