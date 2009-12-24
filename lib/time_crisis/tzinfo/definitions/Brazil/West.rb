require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Brazil
      module West
        include TimezoneDefinition
        
        linked_timezone 'Brazil/West', 'America/Manaus'
      end
    end
  end
end
