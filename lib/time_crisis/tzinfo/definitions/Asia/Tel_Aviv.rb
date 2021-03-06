require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Tel_Aviv
        include TimezoneDefinition
        
        linked_timezone 'Asia/Tel_Aviv', 'Asia/Jerusalem'
      end
    end
  end
end
