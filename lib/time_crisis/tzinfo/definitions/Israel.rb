require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Israel
      include TimezoneDefinition
      
      linked_timezone 'Israel', 'Asia/Jerusalem'
    end
  end
end
