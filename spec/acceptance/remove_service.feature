@acceptance
Feature: Remove Service Commands
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed
    And I am in a project directory called 'test'
    And I run `picobox init rails`
    And I run `picobox service add postgres`


  Scenario: Removing service
    Given I run `picobox service remove postgres`
    Then the output should match:
      """
        Removing postgres service
            modify  .+test\/docker-compose.yml
        Service postgres removed
        Picobox starting \[:spinner\]
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
          hostname: picobox_test
        webpack:
          build: "."
          entrypoint: ".picobox/start"
          volumes_from:
          - bundle
          volumes:
          - ".:/var/www:cached"
          environment:
            RAILS_ENV: development
          hostname: picobox
          ports:
          - 8080:8080
        bundle:
          image: busybox
          volumes:
          - bundle-data:/usr/local/bundle:cached
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
          hostname: picobox_test
        webpack:
          build: "."
          entrypoint: ".picobox/start"
          volumes_from:
          - bundle
          volumes:
          - ".:/var/www:cached"
          environment:
            RAILS_ENV: development
          hostname: picobox
          ports:
          - 8080:8080
        bundle:
          image: busybox
          volumes:
          - bundle-data:/usr/local/bundle:cached
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
          hostname: picobox_test
        webpack:
          build: "."
          entrypoint: ".picobox/start"
          volumes_from:
          - bundle
          volumes:
          - ".:/var/www:cached"
          environment:
            RAILS_ENV: development
          hostname: picobox
          ports:
          - 8080:8080
        bundle:
          image: busybox
          volumes:
          - bundle-data:/usr/local/bundle:cached
      """


  Scenario: Removing service in project sub-directory
    Given a directory named "lib"
    And I cd to "lib"
    When I run `picobox service remove postgres`
    Then the output should match:
      """
        Removing postgres service
            modify  .+test\/docker-compose.yml
        Service postgres removed
        Picobox starting \[:spinner\]
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
             error  could not open .+test\/docker-compose.yml
      """