require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Shiprock
        include TimezoneDefinition
        
        linked_timezone 'America/Shiprock', 'America/Denver'
      end
    end
  end
end
