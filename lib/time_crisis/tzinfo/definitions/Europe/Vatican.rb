require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Vatican
        include TimezoneDefinition
        
        linked_timezone 'Europe/Vatican', 'Europe/Rome'
      end
    end
  end
end
