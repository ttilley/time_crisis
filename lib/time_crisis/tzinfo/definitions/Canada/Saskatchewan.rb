require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Canada
      module Saskatchewan
        include TimezoneDefinition
        
        linked_timezone 'Canada/Saskatchewan', 'America/Regina'
      end
    end
  end
end
