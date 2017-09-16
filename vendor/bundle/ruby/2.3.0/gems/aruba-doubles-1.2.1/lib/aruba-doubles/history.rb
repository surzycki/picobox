module ArubaDoubles
  class History

    include Enumerable

    def initialize(filename)
      @store = PStore.new(filename)
    end

    def <<(args)
      @store.transaction do
        @store[:history] ||= []
        @store[:history] << args
      end
    end

    def clear
      @store.transaction do
        @store[:history] = []
      end
    end

    def each
      entries.each { |e| yield(e) }
    end

    # @return [String] inspection of the entries
    def to_s
      to_a.inspect
    end

    # Return entries just like running `history` in your shell.
    # @return [String] pretty representation of the entries
    def to_pretty
      to_a.each_with_index.map { |e,i| "%5d  %s" % [i+1, e.shelljoin] }.join("\n")
    end

  private

    def entries
      @store.transaction(readonly=true) do
        @store[:history] || []
      end
    end
  end
end
