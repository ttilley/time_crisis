require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Atlantic
      module Faeroe
        include TimezoneDefinition
        
        linked_timezone 'Atlantic/Faeroe', 'Atlantic/Faroe'
      end
    end
  end
end
