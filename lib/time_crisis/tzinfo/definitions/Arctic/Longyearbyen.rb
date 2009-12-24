require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Arctic
      module Longyearbyen
        include TimezoneDefinition
        
        linked_timezone 'Arctic/Longyearbyen', 'Europe/Oslo'
      end
    end
  end
end
