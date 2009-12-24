require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Indianapolis
        include TimezoneDefinition
        
        linked_timezone 'America/Indianapolis', 'America/Indiana/Indianapolis'
      end
    end
  end
end
