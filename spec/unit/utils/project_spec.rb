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
end
