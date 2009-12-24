require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module Victoria
        include TimezoneDefinition
        
        linked_timezone 'Australia/Victoria', 'Australia/Melbourne'
      end
    end
  end
end
