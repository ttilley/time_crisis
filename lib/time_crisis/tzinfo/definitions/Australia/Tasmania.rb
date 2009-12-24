require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module Tasmania
        include TimezoneDefinition
        
        linked_timezone 'Australia/Tasmania', 'Australia/Hobart'
      end
    end
  end
end
