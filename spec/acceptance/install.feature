@acceptance
Feature: Install feature
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox can be installed


  Scenario: Picobox can be installed
    Given I run `picobox install`
    Then the output should match:
      """
      INSTALL PICOBOX
      -------------------------------
        Docker version test! present
        Setting up Config
            create .+aruba\/.picobox
            create .+aruba\/.picobox/picobox.ini
        Updating packages \[:spinner\]
        Packages updated!
        Setting up Shell
            create .+aruba\/.picobox/extensions.bash
            append .+aruba\/.profile
        Install Complete
      -------------------------------

      You should reload open shells to pick up shell changes

           opening  new shell
      """
    Then a directory named ".picobox" should exist
    And a directory named "packages" should exist
    And a file named ".picobox/extensions.bash" should exist
    And a file named ".picobox/picobox.ini" should exist
    And the file named ".profile" should contain "source ~/.picobox/extensions.bash"
    And the file named ".picobox/picobox.ini" should contain "version ="
    And the file named ".picobox/picobox.ini" should contain "last_update ="



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
        Setting up Config
            create .+aruba\/.picobox
            create .+aruba\/.picobox/picobox.ini
        Updating packages \[:spinner\]
        Packages updated!
        Setting up Shell
             error  shell not supported .+

      You can file a request at: https://github.com/surzycki/picobox
      and we'll get right on it!
      """


  Scenario: Picobox on unsupported shell switch to supported shell
    Given I am using an unsupported shell
    And I run `picobox install`
    Then I am using 'bash' shell
    When I run `picobox install`
    Then the output should match:
      """
      INSTALL PICOBOX
      -------------------------------
        Docker version test! present
        Setting up Config
        Setting up Shell
            create .+aruba\/.picobox/extensions.bash
            append .+aruba\/.profile
        Install Complete
      -------------------------------

      You should reload open shells to pick up shell changes

           opening  new shell
      """

