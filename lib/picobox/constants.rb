module Picobox
  # names for files / directories
  VERSION          = '0.1.7'
  HOMEPAGE         = 'https://github.com/surzycki/picobox'
  CONFIG_DIR       = '.picobox'
  PROJECT_INI      = 'project.ini'
  SHELL_EXTENSIONS = 'shell_extensions'

  
  module_function
  def root()                 File.expand_path('../../..', __FILE__) end
  def template_dir()         "#{Picobox.root}/lib/picobox/templates" end
  def box_packages_dir()     "#{Picobox.root}/lib/picobox/boxes/packages" end
  def service_packages_dir() "#{Picobox.root}/lib/picobox/services/packages" end

  def debug_out()       @debug_out end
  def debug_out=(value) @debug_out = value end
end