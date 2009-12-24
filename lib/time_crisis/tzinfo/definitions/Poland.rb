require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Poland
      include TimezoneDefinition
      
      linked_timezone 'Poland', 'Europe/Warsaw'
    end
  end
end
