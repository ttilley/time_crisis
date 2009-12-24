require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Calcutta
        include TimezoneDefinition
        
        linked_timezone 'Asia/Calcutta', 'Asia/Kolkata'
      end
    end
  end
end
