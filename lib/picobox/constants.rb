module Picobox
  # names for files / directories
  VERSION          = '0.2.1'
  HOMEPAGE         = 'https://github.com/surzycki/picobox'
  CONFIG_DIR       = '.picobox'
  PROJECT_INI      = 'project.ini'
  SHELL_EXTENSIONS = 'shell_extensions'


  module_function
  def root()                 File.expand_path('../../..', __FILE__) end
  def template_dir()         "#{Picobox.root}/lib/picobox/templates" end
  def box_packages_dir()     "#{Picobox.root}/lib/picobox/boxes/packages" end
  def service_packages_dir() "#{Picobox.root}/lib/picobox/services/packages" end

  def output()   @output end
  def verbose?() @verbose end

  def set_verbosity(value)
    @verbose = value
    if @verbose
      @output = '2>&1'
    else
      @output = '> /dev/null 2>&1'
    end
  end
end