require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module US
      module Arizona
        include TimezoneDefinition
        
        linked_timezone 'US/Arizona', 'America/Phoenix'
      end
    end
  end
end
