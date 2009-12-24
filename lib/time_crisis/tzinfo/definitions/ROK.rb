require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module ROK
      include TimezoneDefinition
      
      linked_timezone 'ROK', 'Asia/Seoul'
    end
  end
end
