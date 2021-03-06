require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Chile
      module EasterIsland
        include TimezoneDefinition
        
        linked_timezone 'Chile/EasterIsland', 'Pacific/Easter'
      end
    end
  end
end
