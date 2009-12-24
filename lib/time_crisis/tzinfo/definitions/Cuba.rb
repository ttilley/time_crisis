require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Cuba
      include TimezoneDefinition
      
      linked_timezone 'Cuba', 'America/Havana'
    end
  end
end
