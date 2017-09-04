@acceptance
Feature: Un-install feature
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed
    And the file named ".profile" with "# test bash script"


  Scenario: Picobox can be un-installed
    Given I run `picobox install`
    When I run `picobox uninstall`
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
    Given I run `picobox install`
    And I run `picobox uninstall`
    And I wait 2 seconds
    And I run `picobox install`
    When I run `picobox uninstall`
    And the file named ".profile" should not contain "source ~/.picobox/shell_extensions"
    And the file named ".profile" should contain "# picobox removed"


  Scenario: Picobox cannot be uninstalled when not installed in the first place
    Given I run `picobox uninstall`
    Then the output should match:
      """
        Picobox not installed!
      """