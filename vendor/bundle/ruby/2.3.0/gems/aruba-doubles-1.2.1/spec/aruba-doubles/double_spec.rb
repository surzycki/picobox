require 'spec_helper'

describe ArubaDoubles::Double do
  describe '.setup' do
    before do
      @original_path = ENV['PATH']
      @bindir = '/tmp/foo'
      ArubaDoubles::Double.stub(:bindir).and_return(@bindir)
    end

    after do
      ENV['PATH'] = @original_path
    end

    it 'should prepend the doubles directory to PATH' do
      ENV['PATH'].should_not match(%r(^#{@bindir}))
      ArubaDoubles::Double.setup
      ENV['PATH'].should match(%r(^#{@bindir}))
    end

    it 'should change the path only once' do
      ArubaDoubles::Double.setup
      ArubaDoubles::Double.setup
      ENV['PATH'].scan(@bindir).count.should eq(1)
    end
  end

  describe '.bindir' do
    it 'should create and return the temporary doubles directory' do
      bindir = '/tmp/foo'
      Dir.should_receive(:mktmpdir).once.and_return(bindir)
      ArubaDoubles::Double.bindir.should eq(bindir)
      ArubaDoubles::Double.bindir.should eq(bindir)
    end
  end

  describe '.teardown' do
    before do
      @bindir = '/tmp/foo'
    end

    it 'should delete all registered doubles' do
      doubles = []
      3.times { |i| doubles << double(i) }
      doubles.map{ |d| d.should_receive(:delete) }
      ArubaDoubles::Double.should_receive(:all).and_return(doubles)
      ArubaDoubles::Double.teardown
    end

    it 'should remove the doubles dir'
    it 'should not remove a non-empty doubles dir'

    it 'should remove the doubles dir from PATH' do
      ArubaDoubles::Double.stub(:bindir).and_return(@bindir)
      ArubaDoubles::Double.setup
      ENV['PATH'].should match(%r(^#{@bindir}))
      ArubaDoubles::Double.teardown
      ENV['PATH'].should_not match(%r(^#{@bindir}))
    end

    it 'should not restore PATH when unchanged' do
      original_path = '/foo:/bar:/baz'
      ArubaDoubles::Double.stub(:original_path).and_return('/foo:/bar:/baz')
      ArubaDoubles::Double.teardown
      ENV['PATH'].should_not eq(original_path)
    end
  end

  describe '.new' do
    it 'should execute a given block in the doubles context' do
      double = ArubaDoubles::Double.new('bar') { def hi; "hi" end }
      double.should respond_to(:hi)
    end

    it 'should raise error on missing filename'
    it 'should raise error on absolute filename'
  end

  describe '.find' do
    it 'should return a registered double by name' do
      File.stub(:open).and_return(stub(:puts => nil, :close => nil))
      FileUtils.stub(:chmod)

      ArubaDoubles::Double.find('registered_double').should be_nil
      double = ArubaDoubles::Double.create('registered_double')
      ArubaDoubles::Double.find('registered_double').should eql(double)
    end
  end

  describe '.run' do
    before do
      @double = double('double', :run => nil)
      ArubaDoubles::Double.stub(:new).and_return(@double)
    end

    it 'should initialize a new double with the program name' do
      ArubaDoubles::Double.should_receive(:new).with('rspec')
      ArubaDoubles::Double.run
    end

    it 'should execute a block on that double when given' do
      block = Proc.new {}
      @double.should_receive(:instance_eval).with(&block)
      ArubaDoubles::Double.run(&block)
    end

    it 'should run the double' do
      @double.should_receive(:run)
      ArubaDoubles::Double.run
    end
  end

  describe '#run' do
    before do
      ArubaDoubles::History.stub(:new).and_return(stub(:<< => nil))
      @double = ArubaDoubles::Double.new('foo',
        :puts => 'default stdout',
        :warn => 'default stderr',
        :exit => 23)
      @double.on %w[--hello],
        :puts => 'hello, world.',
        :warn => 'BOOOOM!',
        :exit => 42
      @double.stub(:puts => nil, :warn => nil, :exit => nil)
    end

    it 'should append the call to the doubles history' do
      history = double('history')
      history.should_receive(:<<).with(%w[foo] + ARGV)
      ArubaDoubles::History.should_receive(:new).and_return(history)
      @double.run
    end

    context 'when ARGV does match' do
      def run_double
        @double.run %w[--hello]
      end

      it 'should print given stdout' do
        @double.should_receive(:puts).with('hello, world.')
        run_double
      end

      it 'should print given stderr' do
        @double.should_receive(:warn).with('BOOOOM!')
        run_double
      end

      it 'should return given exit code' do
        @double.should_receive(:exit).with(42)
        run_double
      end
    end

    context 'when ARGV does not match' do
      def run_double
        @double.run %w[--these --arguments --do --not --match]
      end

      it 'should print default stdout' do
        @double.should_receive(:puts).with('default stdout')
        run_double
      end

      it 'should print no stderr' do
        @double.should_receive(:warn).with('default stderr')
        run_double
      end

      it 'should exit with zero' do
        @double.should_receive(:exit).with(23)
        run_double
      end
    end
  end

  describe '.create' do
    before do
      @double = double('double', :create => nil)
      ArubaDoubles::Double.stub(:new).and_return(@double)
    end

    it 'should initialize a new double with the program name' do
      ArubaDoubles::Double.should_receive(:new).with('foo')
      ArubaDoubles::Double.create('foo')
    end

    it 'should execute a block on that double when given' do
      block = Proc.new {}
      @double.should_receive(:instance_eval).with(&block)
      ArubaDoubles::Double.create('foo', &block)
    end

    it 'should create the double' do
      @double.should_receive(:create)
      ArubaDoubles::Double.create('foo')
    end

    it 'should return the new double'
  end

  describe '#create' do
    before do
      File.stub(:open).and_return(stub(:puts => nil, :close => nil))
      FileUtils.stub(:chmod)
      ArubaDoubles::Double.stub(:bindir).and_return('/tmp/foo')
    end

    it 'should create the executable command inside the doubles dir' do
      file = double('file', :puts => nil, :close => nil)
      File.should_receive(:open).with('/tmp/foo/bar', 'w').and_return(file)
      ArubaDoubles::Double.new('bar').create
    end

    it 'should make the file executable' do
      File.stub(:open).and_return(stub(:puts => nil, :close => nil))
      filename = '/tmp/foo/bar'
      FileUtils.should_receive(:chmod).with(0755, filename)
      ArubaDoubles::Double.new('bar').create
    end

    it 'should register the double' do
      double = ArubaDoubles::Double.create('bar')
      ArubaDoubles::Double.all.should include(double)
    end

    it 'should return self' do
      double = ArubaDoubles::Double.new('foo')
      double.create.should eql(double)
    end

    it 'should execute a block on that double when given' do
      double = ArubaDoubles::Double.create('bar')
      block = Proc.new {}
      double.should_receive(:instance_eval).with(&block)
      double.create(&block)
    end
  end

  describe '#to_ruby' do
    before do
      @double = ArubaDoubles::Double.new('foo')
    end

    it 'should start with a she-bang line' do
      @double.to_ruby.should include('#!/usr/bin/env ruby')
    end

    it 'should require the libs' do
      @double.to_ruby.should include('require "aruba-doubles"')
    end

    it 'should include the doubles boilerplate' do
      @double.to_ruby.should match(/^ArubaDoubles::Double.run\s+do.*end$/m)
    end

    it 'should include the defined outputs' do
      @double.on %w(--foo), :puts => 'bar'
      @double.to_ruby.should include('on ["--foo"], {:puts=>"bar"}')
    end

    it 'should not include a block when no output is defined'
  end

  describe '#delete' do
    before do
      File.stub(:open).and_return(stub(:puts => nil, :close => nil))
      FileUtils.stub(:chmod)
      ArubaDoubles::Double.stub(:bindir).and_return('/tmp/foo')
      @double = ArubaDoubles::Double.create('bar')
    end

    it 'should delete the executable file if it exists' do
      File.should_receive(:exists?).with('/tmp/foo/bar').and_return(true)
      FileUtils.should_receive(:rm).with('/tmp/foo/bar')
      @double.delete
    end

    it 'should deregister the double' do
      ArubaDoubles::Double.all.should include(@double)
      @double.delete
      ArubaDoubles::Double.all.should_not include(@double)
    end
  end
end
