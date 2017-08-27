module Picobox::Os
  class Darwin
    FILE = 'Docker.dmg'
    URL  = "https://download.docker.com/mac/stable/#{FILE}"

    def download_docker(start:, progress:)
      @stream = open(URL, content_length_proc: start, progress_proc: progress)
    end

    def install_docker(start:, progress:)
      commands = [
        "/usr/bin/hdiutil attach -noidme -nobrowse -quiet #{filename}",
        "cp -R /Volumes/Docker/Docker.app /Applications",
        "open -a Docker",
        "/usr/bin/hdiutil unmount -quiet /Volumes/Docker"
      ]

      start.call( commands.length + 1 )

      IO.copy_stream( stream, filename )
      progress.call()

      commands.each do |command|
        system(command)
        progress.call()
      end
    end

    private
    attr_reader :stream

    def filename
      "#{Picobox::TMP_DIR}/#{FILE}"
    end
  end
end