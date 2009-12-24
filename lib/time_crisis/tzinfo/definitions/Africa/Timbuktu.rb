require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Africa
      module Timbuktu
        include TimezoneDefinition
        
        linked_timezone 'Africa/Timbuktu', 'Africa/Bamako'
      end
    end
  end
end
