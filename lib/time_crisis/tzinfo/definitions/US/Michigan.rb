require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module US
      module Michigan
        include TimezoneDefinition
        
        linked_timezone 'US/Michigan', 'America/Detroit'
      end
    end
  end
end
