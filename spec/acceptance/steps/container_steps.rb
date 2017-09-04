module ContainerSteps
  step 'there are no containers' do
    docker_compose_ps = <<-EOS
    Name   Command   State   Ports
    ------------------------------
    EOS

    double_cmd('docker-compose ps', puts: docker_compose_ps)
  end

  step 'the containers have been started' do
    docker_compose_ps = <<-EOS
         Name                    Command               State           Ports
    --------------------------------------------------------------------------------
    test_bundle_1     sh                               Exit 0
    test_dev_1        .picobox/start                   Up       0.0.0.0:80->3000/tcp
    test_mysql_1      docker-entrypoint.sh mysqld      Up       3306/tcp
    test_postgres_1   docker-entrypoint.sh postgres    Up       5432/tcp
    test_redis_1      docker-entrypoint.sh redis ...   Up       6379/tcp
    test_test_1       .picobox/start                   Up
    EOS

    double_cmd('docker-compose ps', puts: docker_compose_ps)
  end

  step 'the containers have been stopped' do
    docker_compose_ps = <<-EOS
          Name            Command       State           Ports
    -----------------------------------------------------------------
    picobox_bundle_1   sh               Exit 0
    picobox_dev_1      .picobox/start   Exit     0.0.0.0:80->3000/tcp
    picobox_test_1     .picobox/start   Exit
    EOS

    double_cmd('docker-compose ps', puts: docker_compose_ps)
  end

  step 'there are stopped and started containers' do
    docker_compose_ps = <<-EOS
          Name            Command       State           Ports
    -----------------------------------------------------------------
    picobox_bundle_1   sh               Exit 0
    picobox_dev_1      .picobox/start   Exit     0.0.0.0:80->3000/tcp
    picobox_test_1     .picobox/start   Up
    EOS

    double_cmd('docker-compose ps', puts: docker_compose_ps )
  end

  step 'picobox is :state' do |state|
    if state == 'stopped'
      docker_compose_ps = <<-EOS
           Name                    Command               State           Ports
      --------------------------------------------------------------------------------
      test_bundle_1     sh                               Exit 0
      test_dev_1        .picobox/start                   Exit     0.0.0.0:80->3000/tcp
      test_mysql_1      docker-entrypoint.sh mysqld      Exit     3306/tcp
      test_postgres_1   docker-entrypoint.sh postgres    Exit     5432/tcp
      test_redis_1      docker-entrypoint.sh redis ...   Exit     6379/tcp
      test_test_1       .picobox/start                   Exit
      EOS
    else
      docker_compose_ps = <<-EOS
           Name                    Command               State           Ports
      --------------------------------------------------------------------------------
      test_bundle_1     sh                               Exit 0
      test_dev_1        .picobox/start                   Up       0.0.0.0:80->3000/tcp
      test_mysql_1      docker-entrypoint.sh mysqld      Up       3306/tcp
      test_postgres_1   docker-entrypoint.sh postgres    Up       5432/tcp
      test_redis_1      docker-entrypoint.sh redis ...   Up       6379/tcp
      test_test_1       .picobox/start                   Up
      EOS
    end

    double_cmd('docker-compose ps', puts: docker_compose_ps)
  end
end

RSpec.configure do |config|
  config.include ContainerSteps
end