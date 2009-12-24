require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module UTC
      include TimezoneDefinition
      
      linked_timezone 'UTC', 'Etc/UTC'
    end
  end
end
