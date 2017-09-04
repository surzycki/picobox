@acceptance
Feature: Install feature
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed
    And the file named ".profile" with "# test bash script"


  Scenario: Picobox can be installed
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
    Given I am using an unsupported OS
    And I run `picobox install`
    Then the output should match:
      """
        .+ is not yet supported
      """


  Scenario: Picobox on unsupported shell
    Given I am using an unsupported shell
    And I run `picobox install`
    Then the output should match:
      """
      INSTALL PICOBOX
      -------------------------------
        Docker version test! present
        Setting up Shell
             error  shell not supported .+

      You can file a request at: https://github.com/surzycki/picobox
      and we'll get right on it!
      """