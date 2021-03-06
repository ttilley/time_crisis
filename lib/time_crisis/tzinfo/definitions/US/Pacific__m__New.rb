require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module US
      module Pacific__m__New
        include TimezoneDefinition
        
        linked_timezone 'US/Pacific-New', 'America/Los_Angeles'
      end
    end
  end
end
