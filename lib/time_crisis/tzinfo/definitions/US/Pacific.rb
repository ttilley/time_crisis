require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module US
      module Pacific
        include TimezoneDefinition
        
        linked_timezone 'US/Pacific', 'America/Los_Angeles'
      end
    end
  end
end
