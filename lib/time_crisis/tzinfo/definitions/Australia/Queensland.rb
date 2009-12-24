require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module Queensland
        include TimezoneDefinition
        
        linked_timezone 'Australia/Queensland', 'Australia/Brisbane'
      end
    end
  end
end
