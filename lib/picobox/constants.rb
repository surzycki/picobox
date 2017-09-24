module Picobox
  # names for files / directories
  VERSION           = '0.3.0'
  HOMEPAGE          = 'https://github.com/surzycki/picobox'
  PACKAGES_INFO_URL = 'https://api.github.com/repos/picobox/packages/releases/latest'
  CONFIG_DIR        = '.picobox'
  PROJECT_INI       = 'project.ini'
  PICOBOX_INI       = 'picobox.ini'
  SHELL_EXTENSIONS  = 'extensions.bash'


  module_function
  def root()                 File.expand_path('../../..', __FILE__) end
  def packages_dir()         "#{Picobox.root}/packages" end
  def box_packages_dir()     "#{packages_dir}/boxes" end
  def service_packages_dir() "#{packages_dir}/services" end
  def extensions_dir()       "#{packages_dir}/shell" end

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