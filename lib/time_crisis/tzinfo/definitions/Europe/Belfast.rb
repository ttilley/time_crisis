require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Belfast
        include TimezoneDefinition
        
        linked_timezone 'Europe/Belfast', 'Europe/London'
      end
    end
  end
end
