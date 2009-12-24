require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Canada
      module Central
        include TimezoneDefinition
        
        linked_timezone 'Canada/Central', 'America/Winnipeg'
      end
    end
  end
end
