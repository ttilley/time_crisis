require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Turkey
      include TimezoneDefinition
      
      linked_timezone 'Turkey', 'Europe/Istanbul'
    end
  end
end
