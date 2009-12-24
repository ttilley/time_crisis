require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Catamarca
        include TimezoneDefinition
        
        linked_timezone 'America/Catamarca', 'America/Argentina/Catamarca'
      end
    end
  end
end
