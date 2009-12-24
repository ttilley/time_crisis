require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Katmandu
        include TimezoneDefinition
        
        linked_timezone 'Asia/Katmandu', 'Asia/Kathmandu'
      end
    end
  end
end
