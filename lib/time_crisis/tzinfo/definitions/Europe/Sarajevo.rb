require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Sarajevo
        include TimezoneDefinition
        
        linked_timezone 'Europe/Sarajevo', 'Europe/Belgrade'
      end
    end
  end
end
