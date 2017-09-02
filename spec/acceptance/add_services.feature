@acceptance
Feature: Add Service Commands
  Background:
    Given a mocked home directory
    And I am using a darwin OS
    And docker is installed


  Scenario: Adding service
    Given I run `picobox init rails`
    When I run `picobox add postgres`
    Then the output should match:
      """
        Adding postgres service
            modify  .+aruba\/docker-compose.yml
              info  hostname 'postgres' is visible to other services
              info  postgres user and password are 'picobox'
        Service postgres added
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
          links:
          - postgres
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
          links:
          - postgres
        bundle:
          image: busybox
          volumes:
          - bundle-data:/bundle:cached
        postgres:
          image: postgres:9.4
          volumes:
          - db-data:/var/lib/postgresql/db-data
          environment:
            POSTGRES_USER: picobox
            POSTGRES_PASSWORD: picobox
      """


  Scenario: Adding multiple services
    Given I run `picobox init rails`
    When I run `picobox add postgres`
    And I run `picobox add memcached`
    And I run `picobox add redis`
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
          links:
          - postgres
          - memcached
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
          links:
          - postgres
        bundle:
          image: busybox
          volumes:
          - bundle-data:/bundle:cached
        postgres:
          image: postgres:9.4
          volumes:
          - db-data:/var/lib/postgresql/db-data
          environment:
            POSTGRES_USER: picobox
            POSTGRES_PASSWORD: picobox
        memcached:
          image: sameersbn/memcached:latest
          environment:
            CACHE_SIZE: '64'
        redis:
          image: redis
      """


  Scenario: Adding same service multiple times
    Given I run `picobox init rails`
    And I run `picobox add postgres`
    When I run `picobox add postgres`
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
          links:
          - postgres
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
          links:
          - postgres
        bundle:
          image: busybox
          volumes:
          - bundle-data:/bundle:cached
        postgres:
          image: postgres:9.4
          volumes:
          - db-data:/var/lib/postgresql/db-data
          environment:
            POSTGRES_USER: picobox
            POSTGRES_PASSWORD: picobox
      """


  Scenario: Adding service to un-initialized project
    Given I run `picobox add postgres`
    Then the output should match:
      """
        Adding postgres service
             error  no project found
        Run command in a project directory or create new project with 'picobox init \[BOX\]'
      """


  Scenario: Adding service in project sub-directory
    Given I run `picobox init rails`
    And a directory named "lib"
    And I cd to "lib"
    When I run `picobox add postgres`
    Then the output should match:
      """
        Adding postgres service
            modify  .+aruba\/docker-compose.yml
              info  hostname 'postgres' is visible to other services
              info  postgres user and password are 'picobox'
        Service postgres added
      """


  Scenario: Adding unknown service
    Given I run `picobox init rails`
    And I run `picobox add geek`
    Then the output should match:
      """
        Adding geek service
             error  Geek service is not available...yet
        Available services:
      """


  Scenario: Adding service with missing docker_compose.yml
    Given I run `picobox init rails`
    And the file "docker-compose.yml" does not exist
    When I run `picobox add postgres`
    Then the output should match:
      """
        Adding postgres service
             error  could not open .+aruba\/docker-compose.yml
      """


  Scenario: Adding service (one existing service)
    Given I run `picobox init ruby`
    When I run `picobox add postgres`
    And I run `picobox add redis`
    And the file named "docker-compose.yml" should match:
      """
      ---
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
            BUNDLE_PATH: "/bundle"
          hostname: picobox
          links:
          - postgres
          - redis
        bundle:
          image: busybox
          volumes:
          - bundle-data:/bundle:cached
        postgres:
          image: postgres:9.4
          volumes:
          - db-data:/var/lib/postgresql/db-data
          environment:
            POSTGRES_USER: picobox
            POSTGRES_PASSWORD: picobox
        redis:
          image: redis
      """


  Scenario: Adding service that has no post_install instructions
    Given I run `picobox init ruby`
    And I run `picobox add redis`
    Then the output should match:
      """
        Adding redis service
            modify  .+aruba\/docker-compose.yml
              info  hostname 'redis' is visible to other services
        Service redis added
      """
