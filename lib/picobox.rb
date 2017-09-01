require 'thor'
require 'ruby-progressbar'
require 'wisper'
require 'open-uri'
require 'uri'
require 'tty-file'
require 'tty-command'
require 'tty-platform'
require 'ostruct'
require 'yaml'
require 'inifile'

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
require 'picobox/commands/finish_install'
require 'picobox/commands/initialize_project'
require 'picobox/commands/add_box'
require 'picobox/commands/list_boxes'
require 'picobox/commands/list_services'
require 'picobox/commands/add_service'

require 'picobox/boxes/manifest'
require 'picobox/boxes/unpacker'

require 'picobox/services/manifest'
require 'picobox/services/installer'

require 'picobox/os/abstract'
require 'picobox/os/darwin'
require 'picobox/os/linux'
require 'picobox/os/test_os'
require 'picobox/os/unsupported_os'
require 'picobox/os/current_os'

require 'picobox/shell/startup_script'
require 'picobox/shell/dot_profile'

require 'picobox/version'
require 'picobox/cli'
require 'picobox/installer'
require 'picobox/project'
require 'picobox/box'
require 'picobox/service'

Wisper.subscribe(
  Picobox::Handlers::StdoutHandler.new,
  scope: Picobox::Utils::DomainEventPublisher
)

module Picobox
  # names for files / directories
  CONFIG_DIR      =  '.picobox'
  PROJECT_INI      = 'project.ini'
  SHELL_EXTENSIONS = 'shell_extensions'

  module_function
  def root()                 File.expand_path('../..', __FILE__) end
  def template_dir()         "#{Picobox.root}/lib/picobox/templates" end
  def box_packages_dir()     "#{Picobox.root}/lib/picobox/boxes/packages" end
  def service_packages_dir() "#{Picobox.root}/lib/picobox/services/packages" end
end


