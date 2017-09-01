module Picobox
  module Utils
    class Project
      def initialize(os)
        @os = os
      end


      def project_initialzed?
        return false if os.project_root.nil?
        root   = os.project_root
        target = os.current_dir

        target[0...root.size] == root &&
          (target.size == root.size || target[root.size] == ?/)
      end

      def root
        return false if os.current_dir == '/'
      end

      private
      attr_reader :os
    end
  end
end