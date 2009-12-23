module TimeCrisis
  module TZInfo
    # Represents a timezone defined in a data module.
    class TimezoneInfo #:nodoc:

      # The timezone identifier.
      attr_reader :identifier

      # Constructs a new TimezoneInfo with an identifier.
      def initialize(identifier)
        @identifier = identifier
      end

      # Returns internal object state as a programmer-readable string.
      def inspect
        "#<#{self.class}: #@identifier>"
      end
    end
  end
end
