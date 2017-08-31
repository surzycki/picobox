@acceptance
Feature: CLI Commands
  Background:
    Given a mocked home directory
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
        Docker version test present
        Setting up Shell
            create .+aruba\/.picobox
            append .+aruba\/.profile
        Install Complete
      -------------------------------

      You should reload open shells to pick up shell changes

           opening  new shell
      """
    Then a file named ".picobox" should exist
    And the file named ".profile" should contain "source ~/.picobox"

  @unsupported_os
  Scenario: Picobox on unsupported OS
    And I run `picobox install`
    Then the output should contain "is not yet supported"


  Scenario: Picobox init without box
    Given I run `picobox init`
    Then the output should contain "ERROR:"
    And the output should contain "picobox init [BOX]"


  Scenario: Picobox init with rails box
    Given I run `picobox init rails`
    Then the output should match:
      """
        Initializing Project
            create .+aruba\/.picobox
        Project Initialized
        Creating rails box
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
