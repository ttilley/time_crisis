require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module Canberra
        include TimezoneDefinition
        
        linked_timezone 'Australia/Canberra', 'Australia/Sydney'
      end
    end
  end
end
