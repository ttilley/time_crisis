require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Ashkhabad
        include TimezoneDefinition
        
        linked_timezone 'Asia/Ashkhabad', 'Asia/Ashgabat'
      end
    end
  end
end
