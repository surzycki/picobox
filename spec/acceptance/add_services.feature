@acceptance
Feature: Add Service Commands
  Background:
    Given the test environment is setup
    And I am using a darwin OS
    And picobox has been installed
    And I am in a project directory called 'test'
    And I run `picobox init rails`


  Scenario: Adding service
    Given I run `picobox service add postgres`
    Then the output should match:
      """
        Adding postgres service
            modify  .+test\/docker-compose.yml
              info  hostname 'postgres' is visible to other services
              info  postgres user and password are 'picobox'
        Service postgres added
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
          hostname: picobox_test
          links:
          - postgres
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
        postgres:
          image: postgres:9.4
          volumes:
          - db-data:/var/lib/postgresql/data
          environment:
            POSTGRES_USER: picobox
            POSTGRES_PASSWORD: picobox
      """


  Scenario: Adding multiple services
    Given I run `picobox service add postgres memcached redis`
    Then the output should match:
      """
        Adding postgres service
            modify  .+test\/docker-compose.yml
              info  hostname 'postgres' is visible to other services
              info  postgres user and password are 'picobox'
        Service postgres added
        Adding memcached service
            modify  .+test\/docker-compose.yml
              info  hostname 'memcached' is visible to other services
        Service memcached added
        Adding redis service
            modify  .+test\/docker-compose.yml
              info  hostname 'redis' is visible to other services
        Service redis added
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
          hostname: picobox_test
          links:
          - postgres
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
        postgres:
          image: postgres:9.4
          volumes:
          - db-data:/var/lib/postgresql/data
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
    Given I run `picobox service add postgres`
    When I run `picobox service add postgres`
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
          hostname: picobox_test
          links:
          - postgres
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
        postgres:
          image: postgres:9.4
          volumes:
          - db-data:/var/lib/postgresql/data
          environment:
            POSTGRES_USER: picobox
            POSTGRES_PASSWORD: picobox
      """


  Scenario: Adding multiple services with an undefined service
    Given I run `picobox service add postgres geek redis`
    Then the output should match:
      """
        Adding postgres service
            modify  .+test\/docker-compose.yml
              info  hostname 'postgres' is visible to other services
              info  postgres user and password are 'picobox'
        Service postgres added
        Adding geek service
             error  geek service is not available...yet
      """


  Scenario: Adding service in project sub-directory
    Given a directory named "lib"
    And I cd to "lib"
    When I run `picobox service add postgres`
    Then the output should match:
      """
        Adding postgres service
            modify  .+test\/docker-compose.yml
              info  hostname 'postgres' is visible to other services
              info  postgres user and password are 'picobox'
        Service postgres added
        Picobox starting \[:spinner\]
        Picobox started!
      """


  Scenario: Adding unknown service
    Given I run `picobox service add geek`
    Then the output should match:
      """
        Adding geek service
             error  geek service is not available...yet
      """


  Scenario: Adding service with missing docker_compose.yml
    Given the file "docker-compose.yml" does not exist
    When I run `picobox service add postgres`
    Then the output should match:
      """
        Adding postgres service
             error  could not open .+test\/docker-compose.yml
      """


  Scenario: Adding service with only dev service (no test service)
    Given the project is uninitialized
    And I run `picobox init ruby`
    When I run `picobox service add postgres`
    And I run `picobox service add redis`
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
          hostname: picobox
          links:
          - postgres
          - redis
        bundle:
          image: busybox
          volumes:
          - bundle-data:/usr/local/bundle:cached
        postgres:
          image: postgres:9.4
          volumes:
          - db-data:/var/lib/postgresql/data
          environment:
            POSTGRES_USER: picobox
            POSTGRES_PASSWORD: picobox
        redis:
          image: redis
      """


  Scenario: Adding service that has no post_install instructions
    Given I run `picobox service add redis`
    Then the output should match:
      """
        Adding redis service
            modify  .+test\/docker-compose.yml
              info  hostname 'redis' is visible to other services
        Service redis added
      """
