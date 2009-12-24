require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Argentina
        module ComodRivadavia
          include TimezoneDefinition
          
          linked_timezone 'America/Argentina/ComodRivadavia', 'America/Argentina/Catamarca'
        end
      end
    end
  end
end
