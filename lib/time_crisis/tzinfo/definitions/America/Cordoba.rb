require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Cordoba
        include TimezoneDefinition
        
        linked_timezone 'America/Cordoba', 'America/Argentina/Cordoba'
      end
    end
  end
end
