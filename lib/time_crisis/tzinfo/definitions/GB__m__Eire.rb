require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module GB__m__Eire
      include TimezoneDefinition
      
      linked_timezone 'GB-Eire', 'Europe/London'
    end
  end
end
