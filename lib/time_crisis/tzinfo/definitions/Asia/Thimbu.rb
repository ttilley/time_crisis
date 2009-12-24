require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Thimbu
        include TimezoneDefinition
        
        linked_timezone 'Asia/Thimbu', 'Asia/Thimphu'
      end
    end
  end
end
