require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Portugal
      include TimezoneDefinition
      
      linked_timezone 'Portugal', 'Europe/Lisbon'
    end
  end
end
