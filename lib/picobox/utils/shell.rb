module Picobox
  module Utils
    class Shell
      def initialize(os)
        @os = os
      end


      def reload
        # hack to load newly set aliases into shell
        os.reload_shell
      end

      private
      attr_reader :os
    end
  end
end