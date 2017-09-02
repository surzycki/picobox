module Picobox
  module Utils
    class Project
      def initialize(os)
        @os = os
      end


      def project_initialized?
        return false if os.project_root.nil?
        root   = os.project_root
        target = os.current_dir

        target[0...root.size] == root &&
          (target.size == root.size || target[root.size] == ?/)
      end


      def root
        find_root_from Pathname.new(os.current_dir)
      end

      private
      attr_reader :os

      def find_root_from(dir)
        return nil if dir.root?

        if Pathname.new("#{dir}/#{Picobox::CONFIG_DIR}/#{Picobox::PROJECT_INI}").exist?
          return dir.to_s
        else
          dir, base = dir.split
          find_root_from dir
        end
      end
    end
  end
end