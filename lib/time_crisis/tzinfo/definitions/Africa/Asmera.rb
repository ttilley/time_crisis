require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Africa
      module Asmera
        include TimezoneDefinition
        
        linked_timezone 'Africa/Asmera', 'Africa/Asmara'
      end
    end
  end
end
