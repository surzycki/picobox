module OsSteps
  step 'I am using an unsupported OS' do
    allow(Picobox::Os::CurrentOs).
      to receive(:get).
      and_return Picobox::Os::UnsupportedOs
  end

  step 'I am using an unsupported shell' do
    allow(Picobox::Os::CurrentOs.get).
      to receive(:user_shell).
      and_return('/sh')
  end

  step 'I am using a darwin OS' do
    allow(Picobox::Os::CurrentOs).
      to receive(:get).
      and_return Picobox::Os::Darwin
    # stub shell reloading, otherwise we shell out to a prompt
    # during the test running
    allow(Picobox::Os::CurrentOs.get).
      to receive(:reload_shell).
      and_return(true)
  end

  step 'docker is installed' do
    allow(Picobox::Os::CurrentOs.get).
      to receive(:docker_version?).
      and_return 'Docker version test!'

    allow(Picobox::Os::CurrentOs.get).
      to receive(:docker_installed?).
      and_return true

    # don't do anything docker-ish during tests
    double_cmd('docker-compose up -d 2>/dev/null')
    double_cmd('docker-compose stop 2>/dev/null')
    double_cmd('docker-compose build')
  end
end

RSpec.configure do |config|
  config.include OsSteps
end