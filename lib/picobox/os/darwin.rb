module Picobox::Os
  class Darwin
    def install_docker
      file = 'Docker.dmg'
      url  = "https://download.docker.com/mac/stable/#{file}"
      path = Picobox::TMP_DIR
      fq_filename = "#{path}/#{file}"

      Formatador.display_line('[green]Downloading Docker[/]')

      progress_bar = nil
      stream = open(url,
        content_length_proc: proc { |total|
          if total.to_i > 0
            progress_bar = ProgressBar.create(
              format:         "%a %b\u{15E7}%i %p%% %t",
              progress_mark:  ' ',
              remainder_mark: "\u{FF65}",
              title:          'Downloaded',
              total:          total
            )
          end
        },
        progress_proc: proc { |step|
          progress_bar.progress = step
        }
      )

      Formatador.display_line('[green]Installing Docker[/]')
      total_steps = 6

      progress = Formatador::ProgressBar.new(total_steps) { |b| b.opts[:color] = "green" }
      progress.increment

      IO.copy_stream( stream, fq_filename)
      progress.increment

      [
        "/usr/bin/hdiutil attach -noidme -nobrowse -quiet #{fq_filename}",
        "cp -R /Volumes/Docker/Docker.app /Applications",
        "open -a Docker",
        "/usr/bin/hdiutil unmount -quiet /Volumes/Docker"
      ].each do |command|
        system(command)
        progress.increment
      end

      Formatador.display_line('[green]Installed Docker[/]')
    end
  end
end