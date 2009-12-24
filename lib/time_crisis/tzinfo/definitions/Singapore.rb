require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Singapore
      include TimezoneDefinition
      
      linked_timezone 'Singapore', 'Asia/Singapore'
    end
  end
end
