describe Picobox::Utils::Project do
  subject  { described_class.new os}
  let(:os) { Picobox::Os::Darwin }

  describe '#project_initialized?' do
    context 'when no project root' do
      before do
        allow(os).
          to receive(:project_root).
          and_return nil
      end

      it 'returns false' do
        expect(subject.project_initialized?).to eq false
      end
    end


    context 'when in project root directory' do
      before do
        allow(os).
          to receive(:project_root).
          and_return '/Users/project'

        allow(os).
          to receive(:current_dir).
          and_return '/Users/project'
      end

      it 'returns true' do
        expect(subject.project_initialized?).to eq true
      end
    end


    context 'when in a subdirectory of project root' do
      before do
        allow(os).
          to receive(:project_root).
          and_return '/Users/project'

        allow(os).
          to receive(:current_dir).
          and_return '/Users/project/project/propeller/'
      end

      it 'returns true' do
        expect(subject.project_initialized?).to eq true
      end
    end
  end


  describe '#root', aruba: true do
    pending

    before do

    end
  end


  describe '#running?', aruba: true do
    before do
      double_cmd('docker-compose ps', puts: docker_compose_ps)
    end

    context 'all services running' do
      let(:docker_compose_ps) do
        <<-EOS
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

      it 'returns true' do
        expect(subject.running?).to eq true
      end
    end

    context 'services not running' do
      let(:docker_compose_ps) do
        <<-EOS
             Name                    Command               State           Ports
        --------------------------------------------------------------------------------
        test_bundle_1     sh                               Exit 0
        test_dev_1        .picobox/start                   Exit     0.0.0.0:80->3000/tcp
        test_mysql_1      docker-entrypoint.sh mysqld      Up       3306/tcp
        test_postgres_1   docker-entrypoint.sh postgres    Up       5432/tcp
        test_redis_1      docker-entrypoint.sh redis ...   Up       6379/tcp
        test_test_1       .picobox/start                   Exit
        EOS
      end

      it 'returns false' do
        expect(subject.running?).to eq false
      end
    end


    context 'services up, extra services down' do
      let(:docker_compose_ps) do
        <<-EOS
             Name                    Command               State           Ports
        --------------------------------------------------------------------------------
        test_bundle_1     sh                               Exit 0
        test_dev_1        .picobox/start                   Up     0.0.0.0:80->3000/tcp
        test_mysql_1      docker-entrypoint.sh mysqld      Exit     3306/tcp
        test_postgres_1   docker-entrypoint.sh postgres    Exit     5432/tcp
        test_redis_1      docker-entrypoint.sh redis ...   Exit     6379/tcp
        test_test_1       .picobox/start                   Up
        EOS
      end

      it 'returns true' do
        expect(subject.running?).to eq true
      end
    end


    context 'all services down' do
      let(:docker_compose_ps) do
        <<-EOS
             Name                    Command               State           Ports
        --------------------------------------------------------------------------------
        test_bundle_1     sh                               Exit 0
        test_dev_1        .picobox/start                   Exit     0.0.0.0:80->3000/tcp
        test_mysql_1      docker-entrypoint.sh mysqld      Exit     3306/tcp
        test_postgres_1   docker-entrypoint.sh postgres    Exit     5432/tcp
        test_redis_1      docker-entrypoint.sh redis ...   Exit     6379/tcp
        test_test_1       .picobox/start                   Exit
        EOS
      end

      it 'returns false' do
        expect(subject.running?).to eq false
      end
    end


    context 'some services down' do
      let(:docker_compose_ps) do
        <<-EOS
             Name                    Command               State           Ports
        --------------------------------------------------------------------------------
        test_bundle_1     sh                               Exit 0
        test_dev_1        .picobox/start                   Up       0.0.0.0:80->3000/tcp
        test_mysql_1      docker-entrypoint.sh mysqld      Exit     3306/tcp
        test_postgres_1   docker-entrypoint.sh postgres    Exit     5432/tcp
        test_redis_1      docker-entrypoint.sh redis ...   Exit     6379/tcp
        test_test_1       .picobox/start                   Exit
        EOS
      end

      it 'returns false' do
        expect(subject.running?).to eq false
      end
    end
  end
end
