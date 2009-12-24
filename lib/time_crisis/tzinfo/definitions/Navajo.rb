require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Navajo
      include TimezoneDefinition
      
      linked_timezone 'Navajo', 'America/Denver'
    end
  end
end
