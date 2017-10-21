describe Picobox::Shell::StartupScript do
  describe '.get' do
    around do |example|
      ClimateControl.modify HOME: expand_path('.') do
        example.run
      end
    end

    before do
      write_file('.bashrc',       '# test bashrc startup')
      write_file('.bash_profile', '# test bash_profile startup')
      write_file('.bash_login',   '# test bash startup')
      write_file('.profile',      '# test bash startup')
      write_file('.zshrc',        '# test zshrc startup')
    end

    context 'when darwin' do
      let(:os)  { Picobox::Os::Darwin }

      context 'when bash' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/bin/bash')
        end

        context 'when .bashrc' do
          it 'returns Bash' do
            expect(described_class.get(os)).
              to be_kind_of Picobox::Shell::Bash
          end

          it 'returns .bashrc' do
            expect(described_class.get(os).filename).
              to match /.bashrc/
          end
        end


        context 'when .bash_profile' do
          before { remove('.bashrc') }

          it 'returns Bash' do
            expect(described_class.get(os)).
              to be_kind_of Picobox::Shell::Bash
          end

          it 'returns .bash_profile' do
            expect(described_class.get(os).filename).
              to match /.bash_profile/
          end
        end


        context 'when .bash_login' do
          before do
            remove('.bashrc')
            remove('.bash_profile')
          end

          it 'returns Bash' do
            expect(described_class.get(os)).
              to be_kind_of Picobox::Shell::Bash
          end

          it 'returns .bash_login' do
            expect(described_class.get(os).filename).
              to match /.bash_login/
          end
        end


        context 'when .profile' do
          before do
            remove('.bashrc')
            remove('.bash_profile')
            remove('.bash_login')
          end

          it 'returns Bash' do
            expect(described_class.get(os)).
              to be_kind_of Picobox::Shell::Bash
          end

          it 'returns .profile' do
            expect(described_class.get(os).filename).
              to match /.profile/
          end
        end
      end


      context 'when zsh' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/bin/zsh')
        end

        it 'returns Zsh' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::Zsh
        end

        it 'returns .zsh' do
          expect(described_class.get(os).filename).
            to match /.zsh/
        end
      end

      # non standard location ie homebrew installed bash
      context 'when non-standard bash' do
        before do
          remove('.bashrc')
          remove('.bash_profile')
          remove('.bash_login')
          allow(os).to receive(:user_shell).
            and_return('/usr/local/bin/bash')
        end

        context 'when .profile' do
          it 'returns Bash' do
            expect(described_class.get(os)).
              to be_kind_of Picobox::Shell::Bash
          end

          it 'returns .profile' do
            expect(described_class.get(os).filename).
              to match /.profile/
          end
        end
      end
    end


    context 'when linux' do
      let(:os)  { Picobox::Os::Linux }

      context 'when zsh' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/usr/bin/zsh')
        end

        it 'returns Zsh' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::Zsh
        end

        it 'returns .zsh' do
          expect(described_class.get(os).filename).
            to match /.zsh/
        end
      end


      context 'when bash' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/bin/bash')
        end

        it 'returns Bash' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::Bash
        end

        it 'returns .bashrc' do
          expect(described_class.get(os).filename).
            to match /.bashrc/
        end
      end

      # non standard location
      context 'when non-standard zsh' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/usr/local/bin/zsh')
        end

        it 'returns Zsh' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::Zsh
        end

        it 'returns .zsh' do
          expect(described_class.get(os).filename).
            to match /.zsh/
        end
      end
    end
  end
end