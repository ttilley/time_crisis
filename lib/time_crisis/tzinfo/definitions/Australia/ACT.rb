require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module ACT
        include TimezoneDefinition
        
        linked_timezone 'Australia/ACT', 'Australia/Sydney'
      end
    end
  end
end
