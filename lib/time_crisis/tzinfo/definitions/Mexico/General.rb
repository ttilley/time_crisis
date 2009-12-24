require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Mexico
      module General
        include TimezoneDefinition
        
        linked_timezone 'Mexico/General', 'America/Mexico_City'
      end
    end
  end
end
