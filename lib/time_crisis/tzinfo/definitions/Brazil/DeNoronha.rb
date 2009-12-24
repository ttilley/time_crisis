require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Brazil
      module DeNoronha
        include TimezoneDefinition
        
        linked_timezone 'Brazil/DeNoronha', 'America/Noronha'
      end
    end
  end
end
