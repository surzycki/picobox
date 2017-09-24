@acceptance
Feature: Project uninitialize warnings
  Scenario: Picobox will not start when project uninitialized
    Given I run `picobox start`
    Then the output should match:
      """
             error  no project found
        Run 'picobox init \[BOX\]'
      """

  Scenario: Picobox will not stop when project uninitialized
    Given I run `picobox stop`
    Then the output should match:
      """
             error  no project found
        Run 'picobox init \[BOX\]'
      """


  Scenario: Picobox will not restart when project uninitialized
    Given I run `picobox restart`
    Then the output should match:
      """
             error  no project found
        Run 'picobox init \[BOX\]'
      """


  Scenario: Picobox can not add service when project uninitialized
    Given I run `picobox service add postgres`
    Then the output should match:
      """
        Adding postgres service
             error  no project found
        Run 'picobox init \[BOX\]'
      """


  Scenario: Picobox can not remove service when project uninitialized
    Given I run `picobox service remove postgres`
    Then the output should match:
      """
        Removing postgres service
             error  no project found
        Run 'picobox init \[BOX\]'
      """


  Scenario: Picobox can not ssh into service when project uninitialized
    When I run `picobox ssh dev`
    Then the output should match:
      """
        Getting shell
              open  Running dev shell
             error  no project found
        Run 'picobox init \[BOX\]'
      """
