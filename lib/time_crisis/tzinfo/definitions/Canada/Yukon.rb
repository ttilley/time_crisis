require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Canada
      module Yukon
        include TimezoneDefinition
        
        linked_timezone 'Canada/Yukon', 'America/Whitehorse'
      end
    end
  end
end
