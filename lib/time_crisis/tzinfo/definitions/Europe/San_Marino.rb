require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module San_Marino
        include TimezoneDefinition
        
        linked_timezone 'Europe/San_Marino', 'Europe/Rome'
      end
    end
  end
end
