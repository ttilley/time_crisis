require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module PRC
      include TimezoneDefinition
      
      linked_timezone 'PRC', 'Asia/Shanghai'
    end
  end
end
