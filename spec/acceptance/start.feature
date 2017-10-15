@acceptance
Feature: Start Commands
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed
    And I am in a project directory called 'test'
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


  Scenario: Starting system (docker error)
    Given docker throws an error
    When I run `picobox start`
    Then the output should match:
      """
        Picobox starting \[:spinner\]
        Docker gave an error
        Check to see if docker is running
        Try running 'docker ps'
      """


