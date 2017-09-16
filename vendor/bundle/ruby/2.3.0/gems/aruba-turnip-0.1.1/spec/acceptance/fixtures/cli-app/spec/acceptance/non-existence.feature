Feature: Working Directory
  Scenario: Working Directory
    Given a file named "foo/bar/example.txt" with:
    """
    hello world
    """
    When I cd to "foo/bar"
    And I run `cat example.txt`
    Then the output should contain "hello world"
    And the file "example.txt" should exist
