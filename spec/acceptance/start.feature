@acceptance
Feature: Start Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed
    And I run `picobox init rails`


  Scenario: Starting system for the first time
    Given there are no containers
    When I run `picobox start`
    Then the output should match:
      """
        Picobox starting \[:spinner\]
        Picobox started!
      """


  Scenario: Starting system
    Given the containers have been stopped
    When I run `picobox start`
    Then the output should match:
      """
        Picobox starting \[:spinner\]
        Picobox started!
      """


  Scenario: Starting system (one service down)
    Given there are stopped and started containers
    When I run `picobox start`
    Then the output should match:
      """
        Picobox starting \[:spinner\]
        Picobox started!
      """

  Scenario: Starting system when no project intialized
    Given the directory ".picobox" does not exist
    When I run `picobox start`
    Then the output should match:
      """
        Picobox starting \[:spinner\]
             error  no project found
        Run command in a project directory or create new project with
      """


