describe Picobox::DockerCompose::Config do
  describe '#initialize' do
    subject { described_class.new config_yml}
    let(:config_yml) { "#{Picobox.root}/spec/acceptance/fixtures/docker_compose_test.yml" }

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


    it 'raises a ArgumentError if no arguments' do
      expect {
        described_class.new
      }.to raise_error(ArgumentError)
    end
  end


  #describe '#add_service', aruba: true do
  #  subject              { described_class.new config_yml }
  #  let(:config_yml)     { 'tmp/aruba/docker_compose.yml' }
  #  let(:service_source) { 'tmp/aruba/service_source.yml'}

  #  describe 'with dev and test services' do
  #    before do
  #      # move fixture to scratch dir
  #      copy '%/docker_compose_test.yml', 'docker_compose.yml'
  #      copy '%/service_source.yml', 'service_source.yml'

  #      subject.add_service service_source
  #    end

  #    context 'freshly adding service' do
  #      it 'adds service', focus: true do
  #        expect(File.read(config_yml)).to match(
  #          <<~EOS
  #              postgres:
  #                image: postgres:9.4
  #                volumes:
  #                  - db-data:/var/lib/postgresql/db-data
  #                environment:
  #                  POSTGRES_USER: 'picobox'
  #                  POSTGRES_PASSWORD: 'picobox'
  #          EOS
  #        )
  #      end


  #      it 'adds links to dev service' do
  #        expect(File.read(config_yml)).to match(
  #          <<~EOS
  #            dev:
  #              build: .
  #              entrypoint: .picobox/start
  #              volumes:
  #                - .:/var/www:cached
  #              volumes_from:
  #                - bundle
  #              environment:
  #                RAILS_ENV: development
  #                BUNDLE_PATH: /bundle
  #              hostname: picobox
  #              ports:
  #                - '80:3000'
  #              links:
  #                - postgres
  #          EOS
  #        )
  #      end


  #      it 'adds links to test service' do
  #        expect(File.read(config_yml)).to match(
  #          <<~EOS
  #            test:
  #              build: .
  #              entrypoint: .picobox/start
  #              volumes:
  #                - .:/var/www:cached
  #              volumes_from:
  #                - bundle
  #              environment:
  #                RAILS_ENV: test
  #                BUNDLE_PATH: /bundle
  #              hostname: picobox_test
  #              links:
  #                - postgres
  #          EOS
  #        )
  #      end
  #    end


  #    context 'add multiple services' do

  #    end


  #    context 'add same service multiple times' do
  #    end
  #  end
  #end
end
