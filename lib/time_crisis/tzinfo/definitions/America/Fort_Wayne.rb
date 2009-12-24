require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Fort_Wayne
        include TimezoneDefinition
        
        linked_timezone 'America/Fort_Wayne', 'America/Indiana/Indianapolis'
      end
    end
  end
end
