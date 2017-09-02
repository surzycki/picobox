module ContainerSteps
  step 'there are no containers' do
    double_cmd('docker-compose ps', puts: "Name   Command   State   Ports \n------------------------------\n")
  end

  step 'the containers have been started' do
    double_cmd('docker-compose ps', puts: "      Name            Command       State           Ports         \n-----------------------------------------------------------------\npicobox_bundle_1   sh               Exit 0                        \npicobox_dev_1      .picobox/start   Up       0.0.0.0:80->3000/tcp \npicobox_test_1     .picobox/start   Up                            \n")
  end

  step 'the containers have been stopped' do
    double_cmd('docker-compose ps', puts: "      Name            Command       State           Ports         \n-----------------------------------------------------------------\npicobox_bundle_1   sh               Exit 0                        \npicobox_dev_1      .picobox/start   Exit     0.0.0.0:80->3000/tcp \npicobox_test_1     .picobox/start   Exit                          \n")
  end

  step 'there are stopped and started containers' do
    double_cmd('docker-compose ps', puts: "      Name            Command       State           Ports         \n-----------------------------------------------------------------\npicobox_bundle_1   sh               Exit 0                        \npicobox_dev_1      .picobox/start   Exit     0.0.0.0:80->3000/tcp \npicobox_test_1     .picobox/start   Up                            \n")
  end
end

RSpec.configure do |config|
  config.include ContainerSteps
end