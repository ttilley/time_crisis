require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module North
        include TimezoneDefinition
        
        linked_timezone 'Australia/North', 'Australia/Darwin'
      end
    end
  end
end
