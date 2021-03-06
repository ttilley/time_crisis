require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Ensenada
        include TimezoneDefinition
        
        linked_timezone 'America/Ensenada', 'America/Tijuana'
      end
    end
  end
end
