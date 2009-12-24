require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Rosario
        include TimezoneDefinition
        
        linked_timezone 'America/Rosario', 'America/Argentina/Cordoba'
      end
    end
  end
end
