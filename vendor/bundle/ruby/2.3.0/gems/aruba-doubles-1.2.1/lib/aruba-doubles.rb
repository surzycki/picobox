require 'tempfile'
require 'shellwords'
require 'pstore'
require 'aruba-doubles/double'
require 'aruba-doubles/history'

module ArubaDoubles

  # Basename of the history file
  HISTORY_FILE = 'history.pstore'

  def double_cmd(cmd, output = {})
    argv = cmd.shellsplit
    filename = argv.shift
    double = Double.find(filename) || Double.new(filename)
    double.create { on argv, output }
  end

  def history
    @history ||= History.new(File.join(Double.bindir, HISTORY_FILE))
  end
end
