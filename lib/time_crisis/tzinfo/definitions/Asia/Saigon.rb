require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Saigon
        include TimezoneDefinition
        
        linked_timezone 'Asia/Saigon', 'Asia/Ho_Chi_Minh'
      end
    end
  end
end
