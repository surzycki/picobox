module Picobox
  module Utils
    module Visitable
      def accept visitor
        visitor.visit(self)
      end
    end
  end
end
