@acceptance
Feature: CLI Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed


  Scenario: Picobox can be installed
    Given the file named ".profile" with "# test bash script"
    And I run `picobox install`
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
