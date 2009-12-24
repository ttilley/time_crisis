require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module NSW
        include TimezoneDefinition
        
        linked_timezone 'Australia/NSW', 'Australia/Sydney'
      end
    end
  end
end
