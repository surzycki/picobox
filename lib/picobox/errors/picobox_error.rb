module Picobox
  module Errors
    class PicoboxError < StandardError; end
    class UnknownError < PicoboxError; end
    class BoxNotImplemented < PicoboxError; end
    class ServiceNotImplemented < PicoboxError; end
    class ServiceNotInstalled < PicoboxError; end
    class ShellNotSupported < PicoboxError; end
    class ProjectNotInitialized < PicoboxError; end
    class SystemDownError < PicoboxError; end
    class UnsupportedOsError < PicoboxError; end
    class FileNotFoundError < PicoboxError; end
    class PicoboxNotInstalled < PicoboxError; end
    class DistroNotSupported < PicoboxError; end
    class DockerError < PicoboxError; end
  end
end