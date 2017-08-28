require 'thor'
require 'formatador'
require 'ruby-progressbar'
require 'wisper'
require 'open-uri'
require 'uri'
require 'tty-file'
require 'byebug'

require 'picobox/utils/progress_bar'
require 'picobox/utils/visitable'
require 'picobox/utils/domain_event_publisher'
require 'picobox/utils/visitor_by_os'
require 'picobox/utils/shell_startup_script'

require 'picobox/errors/picobox_error'

require 'picobox/handlers/stdout_handler'

require 'picobox/commands/download_docker'
require 'picobox/commands/install_docker'
require 'picobox/commands/setup_shell'

require 'picobox/os/darwin'
require 'picobox/os/linux'

require 'picobox/shell/profile'

require 'picobox/version'
require 'picobox/cli'
require 'picobox/installer'
require 'picobox/user_shell'

Wisper.subscribe(
  Picobox::Handlers::StdoutHandler.new,
  scope: Picobox::Utils::DomainEventPublisher
)

module Picobox
  module_function
  def root() File.expand_path('../picobox', __FILE__) end
end


