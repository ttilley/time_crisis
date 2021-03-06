require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module US
      module Aleutian
        include TimezoneDefinition
        
        linked_timezone 'US/Aleutian', 'America/Adak'
      end
    end
  end
end
