require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Libya
      include TimezoneDefinition
      
      linked_timezone 'Libya', 'Africa/Tripoli'
    end
  end
end
