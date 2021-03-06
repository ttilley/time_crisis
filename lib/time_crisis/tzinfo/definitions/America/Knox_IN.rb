require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Knox_IN
        include TimezoneDefinition
        
        linked_timezone 'America/Knox_IN', 'America/Indiana/Knox'
      end
    end
  end
end
