require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Greenwich
      include TimezoneDefinition
      
      linked_timezone 'Greenwich', 'Etc/GMT'
    end
  end
end
