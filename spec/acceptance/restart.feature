@acceptance
Feature: Restart Commands
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed
    And I am in a project directory called 'test'
    And I run `picobox init rails`


  Scenario: When picobox is stopped
    Given picobox is stopped
    When I run `picobox restart`
    Then the output should match:
      """
        Picobox starting \[:spinner\]
        Picobox started!
      """


  Scenario: When picobox is started
    Given picobox is started
    When I run `picobox restart`
    Then the output should match:
      """
        Picobox stopping \[:spinner\]
        Picobox stopped!
        Picobox starting \[:spinner\]
        Picobox started!
      """