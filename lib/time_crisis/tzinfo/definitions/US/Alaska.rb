require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module US
      module Alaska
        include TimezoneDefinition
        
        linked_timezone 'US/Alaska', 'America/Anchorage'
      end
    end
  end
end
