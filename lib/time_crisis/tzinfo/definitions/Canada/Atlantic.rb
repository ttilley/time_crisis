require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Canada
      module Atlantic
        include TimezoneDefinition
        
        linked_timezone 'Canada/Atlantic', 'America/Halifax'
      end
    end
  end
end
