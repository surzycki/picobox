@acceptance
Feature: CLI Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed
    And the file named ".profile" with "# test bash script"

  Scenario: Picobox has a version
    Given I run `picobox version`
    Then the output should contain "0.1.5"


  Scenario: Picobox can be installed
    Given I run `picobox install`
    Then the output should match:
      """
      INSTALL PICOBOX
      -------------------------------
        Docker version test! present
        Setting up Shell
            create .+aruba\/.picobox
            create .+aruba\/.picobox/shell_extensions
            append .+aruba\/.profile
        Install Complete
      -------------------------------

      You should reload open shells to pick up shell changes

           opening  new shell
      """
    Then a directory named ".picobox" should exist
    And a file named ".picobox/shell_extensions" should exist
    And the file named ".profile" should contain "source ~/.picobox/shell_extensions"



  Scenario: Picobox on unsupported OS
    And I am using an unsupported OS
    And I run `picobox install`
    Then the output should contain "is not yet supported"


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


  Scenario: Picobox lists boxes
    Given I run `picobox boxes`
    Then the output should match:
      """
        Available boxes:
          rails
          ruby
      """

  Scenario: Picobox lists services
    Given I run `picobox services`
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
