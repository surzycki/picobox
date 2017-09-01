module CliSteps
  step 'I debug' do
    byebug
  end

  step 'I am using an unsupported OS' do
    allow(Picobox::Os::CurrentOs).
      to receive(:get).
      and_return Picobox::Os::UnsupportedOs
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
  end

  step '(a/the) file (named) ":file" :outcome match:' do |file, expect_success, expected|
    if expect_success
      expect(file).not_to have_file_content file_content_matching(expected)
    else
      expect(file).to have_file_content file_content_matching(expected)
    end
  end
end


RSpec.configure do |config|
  config.include CliSteps
end