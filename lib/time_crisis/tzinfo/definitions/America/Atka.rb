require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Atka
        include TimezoneDefinition
        
        linked_timezone 'America/Atka', 'America/Adak'
      end
    end
  end
end
