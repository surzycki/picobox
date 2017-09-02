@acceptance
Feature: Init Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed


  Scenario: Picobox init with rails box
    Given I run `picobox init rails`
    Then the output should match:
      """
        Initializing Project
            create .+aruba\/.picobox
            create .+aruba\/.picobox/project.ini
        Project Initialized
        Adding rails box
            create .+aruba\/.picobox/start
             chmod .+aruba\/.picobox/start
            create .+aruba\/docker-compose.yml
            create .+aruba\/Dockerfile
      """
    And a directory named ".picobox" should exist
    And a file named ".picobox/start" should exist
    And the file named ".picobox/start" should have permissions "0777"
    And a file named "docker-compose.yml" should exist
    And a file named "Dockerfile" should exist
    And a file named ".picobox/project.ini" should exist


  Scenario: Picobox init without box
    Given I run `picobox init`
    Then the output should contain "ERROR:"


  Scenario: Picobox init with unknown box
    Given I run `picobox init nerd`
    Then the output should match:
      """
        Initializing Project
            create .+aruba\/.picobox
            create .+aruba\/.picobox/project.ini
        Project Initialized
        Adding nerd box
             error  Nerd boxes are not available...yet
        Available boxes:
      """