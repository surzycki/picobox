@acceptance
Feature: Stop Commands
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed
    And I am in a project directory called 'test'
    And I run `picobox init rails`


  Scenario: Stopping system
    Given the containers have been started
    When I run `picobox stop`
    Then the output should match:
      """
        Picobox stopping \[:spinner\]
        Picobox stopped!
      """


  Scenario: Stopping system (one service down)
    Given there are stopped and started containers
    When I run `picobox stop`
    Then the output should match:
      """
        Picobox stopping \[:spinner\]
        Picobox stopped!
      """



