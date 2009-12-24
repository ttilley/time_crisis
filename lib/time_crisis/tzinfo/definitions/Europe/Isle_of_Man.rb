require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Isle_of_Man
        include TimezoneDefinition
        
        linked_timezone 'Europe/Isle_of_Man', 'Europe/London'
      end
    end
  end
end
