require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Egypt
      include TimezoneDefinition
      
      linked_timezone 'Egypt', 'Africa/Cairo'
    end
  end
end
