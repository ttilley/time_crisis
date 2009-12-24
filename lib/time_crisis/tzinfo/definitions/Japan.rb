require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Japan
      include TimezoneDefinition
      
      linked_timezone 'Japan', 'Asia/Tokyo'
    end
  end
end
