@acceptance
Feature: Un-install feature
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed


  Scenario: Picobox can be un-installed
    Given I run `picobox uninstall`
    Then the output should match:
      """
      UNINSTALL PICOBOX
      -------------------------------
        Removing shell extentions
            remove .+aruba\/.picobox
           replace .+aruba\/.profile
        Uninstall Complete
      -------------------------------
      """
    And the file named ".profile" should not contain "source ~/.picobox/shell_extensions"
    And the file named ".profile" should contain "# picobox removed"


  Scenario: Picobox can be uninstalled after a reinstall
    Given I run `picobox uninstall`
    And I wait 2 seconds
    And I run `picobox install`
    When I run `picobox uninstall`
    And the file named ".profile" should not contain "source ~/.picobox/shell_extensions"
    And the file named ".profile" should contain "# picobox removed"


