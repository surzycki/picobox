require 'thor'
require 'ruby-progressbar'
require 'wisper'
require 'open-uri'
require 'uri'
require 'tty-file'
require 'tty-command'
require 'tty-platform'
require 'tty-which'
require 'ostruct'
require 'yaml'
require 'inifile'
require 'pathname'

require 'picobox/utils/progress_bar'
require 'picobox/utils/project'
require 'picobox/utils/visitable'
require 'picobox/utils/domain_event_publisher'
require 'picobox/utils/visitor_by_os'
require 'picobox/utils/output'
require 'picobox/utils/shell'

require 'picobox/docker_compose/config'

require 'picobox/errors/picobox_error'

require 'picobox/handlers/stdout_handler'

require 'picobox/commands/download_docker'
require 'picobox/commands/install_docker'
require 'picobox/commands/setup_shell'
require 'picobox/commands/remove_setup_shell'
require 'picobox/commands/start_install'
require 'picobox/commands/build_service'
require 'picobox/commands/start_uninstall'
require 'picobox/commands/finish_install'
require 'picobox/commands/finish_uninstall'
require 'picobox/commands/initialize_project'
require 'picobox/commands/add_box'
require 'picobox/commands/list_boxes'
require 'picobox/commands/list_services'
require 'picobox/commands/add_service'
require 'picobox/commands/remove_service'
require 'picobox/commands/start'
require 'picobox/commands/stop'
require 'picobox/commands/restart'
require 'picobox/commands/open_shell'

require 'picobox/boxes/manifest'
require 'picobox/boxes/unpacker'

require 'picobox/services/manifest'
require 'picobox/services/installer'

require 'picobox/os/abstract'
require 'picobox/os/darwin'
require 'picobox/os/linux'
require 'picobox/os/unsupported_os'
require 'picobox/os/current_os'
require 'picobox/os/distro'

require 'picobox/shell/startup_script'
require 'picobox/shell/dot_profile'
require 'picobox/shell/dot_zshrc'

require 'picobox/constants'
require 'picobox/cli'
require 'picobox/system'
require 'picobox/project'
require 'picobox/box'
require 'picobox/service'

Wisper.subscribe(
  Picobox::Handlers::StdoutHandler.new,
  scope: Picobox::Utils::DomainEventPublisher
)

# silence warnings found in tty-file-0.3.0 for forwarding to private method
$VERBOSE=nil


