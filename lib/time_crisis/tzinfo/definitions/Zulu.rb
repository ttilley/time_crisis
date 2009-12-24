require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Zulu
      include TimezoneDefinition
      
      linked_timezone 'Zulu', 'Etc/UTC'
    end
  end
end
