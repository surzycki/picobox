@acceptance
Feature: CLI Commands
  Background:
    Given a mocked home directory


  Scenario: Adding service to project
    Given I run `picobox init rails`
    And I run `picobox add postgres`
    Then the output should match:
      """
      """


  Scenario: Adding service to un-inialized project
    And I run `picobox add postgres`
    Then the output should match:
      """
        Adding postgres service
        Project has not been initialized, run 'picobox init'
      """


  Scenario: Adding service in project sub-directory


  Scenario: Adding unknown service to project
    Given I run `picobox init rails`
    And I run `picobox add geek`
    Then the output should match:
      """
        Adding geek service
             error  Geek service is not available...yet
      """

