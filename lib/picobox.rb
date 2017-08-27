require 'thor'
require 'formatador'
require 'ruby-progressbar'
require 'wisper'
require 'open-uri'
require 'uri'
require 'byebug'

require 'picobox/utils/progress_bar'
require 'picobox/utils/visitable'
require 'picobox/utils/domain_event_publisher'
require 'picobox/utils/visitor_by_os'


require 'picobox/errors/picobox_error'

require 'picobox/handlers/stdout_handler'

require 'picobox/commands/download_docker'
require 'picobox/commands/install_docker'

require 'picobox/os/darwin'

require 'picobox/version'
require 'picobox/cli'
require 'picobox/installer'

Wisper.subscribe(
  Picobox::Handlers::StdoutHandler.new,
  scope: Picobox::Utils::DomainEventPublisher
)


