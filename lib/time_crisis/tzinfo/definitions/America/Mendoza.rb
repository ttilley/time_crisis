require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Mendoza
        include TimezoneDefinition
        
        linked_timezone 'America/Mendoza', 'America/Argentina/Mendoza'
      end
    end
  end
end
