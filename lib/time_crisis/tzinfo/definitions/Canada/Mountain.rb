require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Canada
      module Mountain
        include TimezoneDefinition
        
        linked_timezone 'Canada/Mountain', 'America/Edmonton'
      end
    end
  end
end
