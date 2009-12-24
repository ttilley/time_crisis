require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Universal
      include TimezoneDefinition
      
      linked_timezone 'Universal', 'Etc/UTC'
    end
  end
end
