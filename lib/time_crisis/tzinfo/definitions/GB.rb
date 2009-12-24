require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module GB
      include TimezoneDefinition
      
      linked_timezone 'GB', 'Europe/London'
    end
  end
end
