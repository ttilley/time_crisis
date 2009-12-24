require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Antarctica
      module South_Pole
        include TimezoneDefinition
        
        linked_timezone 'Antarctica/South_Pole', 'Antarctica/McMurdo'
      end
    end
  end
end
