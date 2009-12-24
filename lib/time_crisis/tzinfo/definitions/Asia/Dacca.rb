require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Dacca
        include TimezoneDefinition
        
        linked_timezone 'Asia/Dacca', 'Asia/Dhaka'
      end
    end
  end
end
