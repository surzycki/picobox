@acceptance
Feature: CLI Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed

  Scenario: Picobox has a version
    Given I run `picobox version`
    Then the output should contain "0.1.7"

 
  Scenario: Picobox lists boxes
    Given I run `picobox boxes`
    Then the output should match:
      """
        Available boxes:
          elixir
          python
          rails
          ruby
      """


  Scenario: Picobox lists services
    Given I run `picobox service list`
    Then the output should match:
      """
        Available services:
          elasticsearch
          memcached
          mongodb
          mysql
          postgres
          redis
      """
