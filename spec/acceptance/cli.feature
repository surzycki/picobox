@acceptance
Feature: CLI Commands
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed


  Scenario: Picobox has a version
    Given I run `picobox version`
    Then the output should contain "0.3.4"


  Scenario: Picobox lists boxes
    Given I run `picobox boxes`
    Then the output should match:
      """
        Available boxes:
          rails
          ruby
      """


  Scenario: Picobox lists services
    Given I run `picobox service list`
    Then the output should match:
      """
        Available services:
          memcached
          postgres
          redis
      """
