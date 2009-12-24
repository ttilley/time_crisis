require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module Yancowinna
        include TimezoneDefinition
        
        linked_timezone 'Australia/Yancowinna', 'Australia/Broken_Hill'
      end
    end
  end
end
