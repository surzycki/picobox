describe Picobox::Shell::StartupScript do
  describe '.get' do
    context 'when darwin' do
      let(:os)  { Picobox::Os::Darwin }

      context '/bin/bash' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/bin/bash')
        end

        it 'returns DotProfile' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::DotProfile
        end
      end

      context '/bin/zsh' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/bin/zsh')
        end

        it 'returns DotZshRC' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::DotZshRC
        end
      end

      # non standard location ie homebrew installed bash
      context '/usr/local/bin/bash' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/usr/local/bin/bash')
        end

        it 'returns DotProfile' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::DotProfile
        end
      end
    end

    context 'when linux' do
      let(:os)  { Picobox::Os::Linux }

      context '/usr/bin/zsh' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/usr/bin/zsh')
        end

        it 'returns DotZshRC' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::DotZshRC
        end
      end


      context '/bin/bash' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/bin/bash')
        end

        it 'returns DotBashRC' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::DotBashRC
        end
      end

      # non standard location
      context '/bin/zsh' do
        before do
          allow(os).to receive(:user_shell).
            and_return('/usr/local/bin/zsh')
        end

        it 'returns DotZshRC' do
          expect(described_class.get(os)).
            to be_kind_of Picobox::Shell::DotZshRC
        end
      end
    end
  end
end