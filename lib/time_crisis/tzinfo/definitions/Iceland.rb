require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Iceland
      include TimezoneDefinition
      
      linked_timezone 'Iceland', 'Atlantic/Reykjavik'
    end
  end
end
