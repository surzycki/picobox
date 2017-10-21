module Picobox
  module Shell
    class Bash < StartupScript
      def filename
        [
          '.bashrc',
          '.bash_profile',
          '.bash_login',
          '.profile'
        ].map do |script|
          Pathname.new("#{os.home_dir}/#{script}")
        end.select do |file|
          file.exist?
        end.first.to_path
      end
    end
  end
end
