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


  step 'I am using :shell shell' do |shell|
    allow(Picobox::Os::CurrentOs.get).
      to receive(:user_shell).
      and_return("/bin/#{shell}")
  end

  step 'I am using a darwin OS' do
    allow(Picobox::Os::CurrentOs).
      to receive(:get).
      and_return Picobox::Os::Darwin

    # we don't want the spinners in the output
    # this will suppress those spinners
    allow(Picobox).
      to receive(:verbose?).
      and_return true

    # stub shell reloading, otherwise we shell out to a prompt
    # during the test running
    allow(Picobox::Os::CurrentOs.get).
      to receive(:reload_shell).
      and_return(true)

    send '(a/the) file (named) ":file_name" with:', '.profile', '# test bash script'
  end

  step 'I am using a linux OS' do
    allow(Picobox::Os::CurrentOs).
      to receive(:get).
      and_return Picobox::Os::Linux

    # we don't want the spinners in the output
    # this will suppress those spinners
    allow(Picobox).
      to receive(:verbose?).
      and_return true

    # stub shell reloading, otherwise we shell out to a prompt
    # during the test running
    allow(Picobox::Os::CurrentOs.get).
      to receive(:reload_shell).
      and_return(true)

    send '(a/the) file (named) ":file_name" with:', '.bashrc', '# test bash script'
  end

  step 'docker is installed' do
    allow(Picobox::Os::CurrentOs.get).
      to receive(:docker_version?).
      and_return 'Docker version test!'

    allow(Picobox::Os::CurrentOs.get).
      to receive(:docker_installed?).
      and_return true

    allow(Picobox::Os::CurrentOs.get).
      to receive(:docker_compose_version?).
      and_return 'Docker Compose version test!'

    allow(Picobox::Os::CurrentOs.get).
      to receive(:docker_compose_installed?).
      and_return true

    # don't do anything docker-ish during tests
    double_cmd('docker-compose up -d 2>/dev/null')
    double_cmd('docker-compose stop 2>/dev/null')
    double_cmd('docker-compose build')
  end


  step 'sudo :whether_to be installed' do |positive|
    allow(TTY::Which).
      to receive(:exist?).
      with('sudo').
      and_return(positive)

    if positive
      double_cmd("sudo -E sh -c 'echo 1 > /dev/null'", :exit => 0)
    end
  end

  step 'I am root' do
    allow(Picobox::Os::CurrentOs.get).
      to receive(:user).
      and_return 'root'
  end
end

RSpec.configure do |config|
  config.include OsSteps
end