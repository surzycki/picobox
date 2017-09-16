Feature: Run commands

  There are several steps to run commands with `aruba`.

  Background:
    Given I use a fixture named "cli-app"

  Scenario: Run command found in path
    Given an executable named "bin/aruba-test-cli" with:
    """
    #!/bin/bash
    exit 0
    """
    And a file named "spec/acceptance/run.feature" with:
    """
    Feature: Run it
      Scenario: Run command
        When I run `bin/aruba-test-cli`
    """
    When I run `rspec`
    Then the features should all pass

  Scenario: Activate desired announcers when running command fails
    Given an executable named "bin/aruba-test-cli" with:
    """
    #!/bin/bash
    echo "Hello, I'm STDOUT"
    exit 1
    """
    And a file named "spec/acceptance/run.feature" with:
    """
    Feature: Run it
      Scenario: Run command
        When I successfully run `bin/aruba-test-cli`
    """
    And I append to "spec/acceptance/support/env.rb" with:
    """
    RSpec.configure do |config|
      config.before do
        aruba.config.activate_announcer_on_command_failure = [:stdout]
      end
    end
    """
    When I run `rspec`
    Then the features should not pass
    And the output should contain:
    """
    <<-STDOUT
    Hello, I'm STDOUT

    STDOUT
    """

  Scenario: Run command found in "bin"-directory which is found in the current directory
    Given a file named "spec/acceptance/run.feature" with:
    """
    Feature: Run it
      Scenario: Run command
        Given an executable named "bin/local_cli" with:
        \"\"\"
        #!/bin/bash
        exit 0
        \"\"\"
        And I look for executables in "bin" within the current directory
        When I successfully run `local_cli`
    """
    When I run `rspec`
    Then the features should all pass
