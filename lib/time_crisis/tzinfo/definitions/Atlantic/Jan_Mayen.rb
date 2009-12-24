require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Atlantic
      module Jan_Mayen
        include TimezoneDefinition
        
        linked_timezone 'Atlantic/Jan_Mayen', 'Europe/Oslo'
      end
    end
  end
end
