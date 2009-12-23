require 'time_crisis/tzinfo/data_timezone_info'
require 'time_crisis/tzinfo/linked_timezone_info'

module TimeCrisis
  module TZInfo

    # TimezoneDefinition is included into Timezone definition modules.
    # TimezoneDefinition provides the methods for defining timezones.
    module TimezoneDefinition #:nodoc:
      # Add class methods to the includee.
      def self.append_features(base)
        super
        base.extend(ClassMethods)
      end

      # Class methods for inclusion.
      module ClassMethods #:nodoc:
        # Returns and yields a DataTimezoneInfo object to define a timezone.
        def timezone(identifier)
          yield @timezone = DataTimezoneInfo.new(identifier)
        end

        # Defines a linked timezone.
        def linked_timezone(identifier, link_to_identifier)
          @timezone = LinkedTimezoneInfo.new(identifier, link_to_identifier)
        end

        # Returns the last TimezoneInfo to be defined with timezone or
        # linked_timezone.
        def get
          @timezone
        end
      end
    end
  end
end
