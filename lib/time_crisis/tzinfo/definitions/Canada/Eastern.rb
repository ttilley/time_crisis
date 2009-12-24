require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Canada
      module Eastern
        include TimezoneDefinition
        
        linked_timezone 'Canada/Eastern', 'America/Toronto'
      end
    end
  end
end
