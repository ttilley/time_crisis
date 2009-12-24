require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Jersey
        include TimezoneDefinition
        
        linked_timezone 'Europe/Jersey', 'Europe/London'
      end
    end
  end
end
