require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Iran
      include TimezoneDefinition
      
      linked_timezone 'Iran', 'Asia/Tehran'
    end
  end
end
