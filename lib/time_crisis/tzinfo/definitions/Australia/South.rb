require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module South
        include TimezoneDefinition
        
        linked_timezone 'Australia/South', 'Australia/Adelaide'
      end
    end
  end
end
