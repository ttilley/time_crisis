require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Chungking
        include TimezoneDefinition
        
        linked_timezone 'Asia/Chungking', 'Asia/Chongqing'
      end
    end
  end
end
