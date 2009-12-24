require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module UCT
      include TimezoneDefinition
      
      linked_timezone 'UCT', 'Etc/UCT'
    end
  end
end
