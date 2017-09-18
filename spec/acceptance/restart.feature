@acceptance
Feature: Restart Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed
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