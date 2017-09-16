require 'spec_helper' 

module ArubaDoubles
  describe History do
    before do
      PStore.stub(:new)
      @history = History.new('history.pstore')
    end

    #TODO: Add examples to test the transactional stuff with PStore!

    it 'should initialize a PStore with the filename' do
      PStore.should_receive(:new).with('history.pstore')
      History.new('history.pstore')
    end

    describe '#to_s' do
      it 'should return an inspection of the entries' do
        @history.stub_chain(:to_a, :inspect).and_return('entries')
        @history.to_s.should eql('entries')
      end
    end

    describe '#to_pretty' do
      it 'should return a pretty representation to the entries' do
        entries = []
        entries << ['foo']
        entries << ['foo', '--bar']
        entries << ['foo', '--bar', 'hello, world.']
        @history.stub(:to_a).and_return(entries)
        @history.to_pretty.should include('1  foo')
        @history.to_pretty.should include('2  foo --bar')
        @history.to_pretty.should include('3  foo --bar hello,\ world.')
      end
    end
  end
end
