require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Jujuy
        include TimezoneDefinition
        
        linked_timezone 'America/Jujuy', 'America/Argentina/Jujuy'
      end
    end
  end
end
