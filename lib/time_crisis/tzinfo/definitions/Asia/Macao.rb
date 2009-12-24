require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Macao
        include TimezoneDefinition
        
        linked_timezone 'Asia/Macao', 'Asia/Macau'
      end
    end
  end
end
