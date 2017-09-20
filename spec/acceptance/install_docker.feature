@acceptance
Feature: Install docker feature
  Given a mocked home directory
  And the file named ".bashrc" with "# test bash script"

  Scenario: Linux install without sudo
    Given I am using a linux OS
    And sudo should not be installed
    When I run `picobox install`
    Then the output should match:
      """
      INSTALL PICOBOX
      -------------------------------
        This installer needs the ability to run commands as root.
        We are unable to find 'sudo' available to make this happen.

        You need to:
          \* Install sudo and add yourself to sudoers
      """


  Scenario: Linux install as root
    Given I am using a linux OS
    And sudo should not be installed
    And I am root
    When I run `picobox install`
    Then the output should match:
      """
      INSTALL PICOBOX
      -------------------------------
        Not a great idea to install things as root user.

        You need to:
          \* Install sudo and add yourself to sudoers
      """
