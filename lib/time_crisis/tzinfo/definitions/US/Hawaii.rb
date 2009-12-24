require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module US
      module Hawaii
        include TimezoneDefinition
        
        linked_timezone 'US/Hawaii', 'Pacific/Honolulu'
      end
    end
  end
end