describe Picobox::DockerCompose::Config do
  subject { described_class.new config_yml}
  let(:config_yml) { "#{Picobox.root}/spec/acceptance/fixtures/docker_compose_test.yml" }


  describe '#initialize' do
    it 'initializes' do
      expect {
        described_class.new config_yml
      }.to_not raise_error
    end

    it 'raises a FileNotFoundError if no docker_compose present' do
      expect {
        described_class.new 'wrong/path/docker_compose.yml'
      }.to raise_error(Picobox::Errors::FileNotFoundError)
    end
  end
end
