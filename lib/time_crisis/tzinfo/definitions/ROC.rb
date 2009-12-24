require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module ROC
      include TimezoneDefinition
      
      linked_timezone 'ROC', 'Asia/Taipei'
    end
  end
end
