@acceptance
Feature: Update packages
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed
    And I am in a project directory called 'test'
    And I run `picobox init rails`

  Scenario: Picobox updates packages when new versions available (box list)
    Given I run `picobox boxes`
    Then the output should match:
      """
        Available boxes:
          rails
          ruby
      """
    When a new package version becomes available
    And I run `picobox boxes`
    Then the output should match:
      """
        Updating packages \[:spinner\]
        Packages updated!
        Available boxes:
          rails
          ruby
      """

  Scenario: Picobox updates packages when new versions available (service list)

