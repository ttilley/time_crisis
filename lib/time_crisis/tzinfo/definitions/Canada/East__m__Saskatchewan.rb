require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Canada
      module East__m__Saskatchewan
        include TimezoneDefinition
        
        linked_timezone 'Canada/East-Saskatchewan', 'America/Regina'
      end
    end
  end
end
