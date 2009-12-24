require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Canada
      module Pacific
        include TimezoneDefinition
        
        linked_timezone 'Canada/Pacific', 'America/Vancouver'
      end
    end
  end
end
