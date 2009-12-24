require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Marigot
        include TimezoneDefinition
        
        linked_timezone 'America/Marigot', 'America/Guadeloupe'
      end
    end
  end
end
