require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Coral_Harbour
        include TimezoneDefinition
        
        linked_timezone 'America/Coral_Harbour', 'America/Atikokan'
      end
    end
  end
end
