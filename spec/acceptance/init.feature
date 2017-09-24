@acceptance
Feature: Init Commands
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed
    And I am in a project directory called 'test'


  Scenario: Picobox init with rails box
    Given I run `picobox init rails`
    Then the output should match:
      """
        Initializing Project
            create .+test\/.picobox
            create .+test\/.picobox/project.ini
        Project Initialized
        Adding rails box
            create .+test\/.picobox/start
             chmod .+test\/.picobox/start
            create .+test\/docker-compose.yml
            create .+test\/Dockerfile
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
            create .+test\/.picobox
            create .+test\/.picobox/project.ini
        Project Initialized
        Adding nerd box
             error  Nerd boxes are not available...yet
        Available boxes:
      """