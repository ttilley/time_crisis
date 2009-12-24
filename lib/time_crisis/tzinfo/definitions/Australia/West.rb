require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module West
        include TimezoneDefinition
        
        linked_timezone 'Australia/West', 'Australia/Perth'
      end
    end
  end
end
