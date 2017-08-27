module Picobox::Utils
  class ProgressBar
    class << self
      def new(size)
        @progress_bar = ::ProgressBar.create(
          format:         "%b\u{15E7}%i %p%% %t",
          progress_mark:  ' ',
          remainder_mark: "\u{FF65}",
          total:          size
        )
      end

      def step(step)
        @progress_bar.progress = step
      end


      def increment
        @progress_bar.progress += 1
      end

      def reset()
      end

      private
      attr_accessor :progress_bar
    end
  end
end