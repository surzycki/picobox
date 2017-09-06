@acceptance
Feature: Remove Service Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed
    Given I run `picobox init rails`
    And I run `picobox service add postgres`


  Scenario: Removing service
    Given I run `picobox service remove postgres`
    Then the output should match:
      """
        Removing postgres service
            modify  .+aruba\/docker-compose.yml
        Service postgres removed
        Picobox starting...
        Picobox started!
      """
    And the file named "docker-compose.yml" should match:
      """
      version: '2'
      volumes:
        db-data:
          external: false
        bundle-data:
          external: false
      services:
        dev:
          build: "."
          entrypoint: ".picobox/start"
          volumes:
          - ".:/var/www:cached"
          volumes_from:
          - bundle
          environment:
            RAILS_ENV: development
            BUNDLE_PATH: "/bundle"
          hostname: picobox
          ports:
          - 80:3000
          - 3000:3000
        test:
          build: "."
          entrypoint: ".picobox/start"
          volumes:
          - ".:/var/www:cached"
          volumes_from:
          - bundle
          environment:
            RAILS_ENV: test
            BUNDLE_PATH: "/bundle"
          hostname: picobox_test
        bundle:
          image: busybox
          volumes:
          - bundle-data:/bundle:cached
      """


  Scenario: Removing multiple services
    Given I run `picobox service add memcached`
    And I run `picobox service add redis`
    Then I run `picobox service remove postgres`
    And I run `picobox service remove memcached`
    And the file named "docker-compose.yml" should match:
      """
      version: '2'
      volumes:
        db-data:
          external: false
        bundle-data:
          external: false
      services:
        dev:
          build: "."
          entrypoint: ".picobox/start"
          volumes:
          - ".:/var/www:cached"
          volumes_from:
          - bundle
          environment:
            RAILS_ENV: development
            BUNDLE_PATH: "/bundle"
          hostname: picobox
          ports:
          - 80:3000
          - 3000:3000
          links:
          - redis
        test:
          build: "."
          entrypoint: ".picobox/start"
          volumes:
          - ".:/var/www:cached"
          volumes_from:
          - bundle
          environment:
            RAILS_ENV: test
            BUNDLE_PATH: "/bundle"
          hostname: picobox_test
        bundle:
          image: busybox
          volumes:
          - bundle-data:/bundle:cached
        redis:
          image: redis
      """


  Scenario: Removing same service multiple times
    Given I run `picobox service remove postgres`
    When I run `picobox service remove postgres`
    Then the output should match:
      """
        Removing postgres service
              info  postgres not installed
      """
    Then the file named "docker-compose.yml" should match:
      """
      version: '2'
      volumes:
        db-data:
          external: false
        bundle-data:
          external: false
      services:
        dev:
          build: "."
          entrypoint: ".picobox/start"
          volumes:
          - ".:/var/www:cached"
          volumes_from:
          - bundle
          environment:
            RAILS_ENV: development
            BUNDLE_PATH: "/bundle"
          hostname: picobox
          ports:
          - 80:3000
          - 3000:3000
        test:
          build: "."
          entrypoint: ".picobox/start"
          volumes:
          - ".:/var/www:cached"
          volumes_from:
          - bundle
          environment:
            RAILS_ENV: test
            BUNDLE_PATH: "/bundle"
          hostname: picobox_test
        bundle:
          image: busybox
          volumes:
          - bundle-data:/bundle:cached
      """


  Scenario: Removing service to un-initialized project
    Given the project is uninitialized
    When I run `picobox service remove postgres`
    Then the output should match:
      """
        Removing postgres service
             error  no project found
        Run command in a project directory or create new project with 'picobox init \[BOX\]'
      """


  Scenario: Removing service in project sub-directory
    Given a directory named "lib"
    And I cd to "lib"
    When I run `picobox service remove postgres`
    Then the output should match:
      """
        Removing postgres service
            modify  .+aruba\/docker-compose.yml
        Service postgres removed
        Picobox starting...
        Picobox started!
      """


  Scenario: Removing unknown service
    Given I run `picobox service remove geek`
    Then the output should match:
      """
        Removing geek service
              info  geek not installed
      """


  Scenario: Removing service with missing docker_compose.yml
    Given the file "docker-compose.yml" does not exist
    When I run `picobox service remove postgres`
    Then the output should match:
      """
        Removing postgres service
             error  could not open .+aruba\/docker-compose.yml
      """