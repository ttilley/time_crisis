require 'time_crisis/tzinfo/timezone_info'

module TimeCrisis
  module TZInfo
    # Represents a linked timezone defined in a data module.
    class LinkedTimezoneInfo < TimezoneInfo #:nodoc:

      # The zone that provides the data (that this zone is an alias for).
      attr_reader :link_to_identifier

      # Constructs a new TimezoneInfo with an identifier and the identifier
      # of the zone linked to.
      def initialize(identifier, link_to_identifier)
        super(identifier)
        @link_to_identifier = link_to_identifier
      end

      # Returns internal object state as a programmer-readable string.
      def inspect
        "#<#{self.class}: #@identifier,#@link_to_identifier>"
      end
    end
  end
end
