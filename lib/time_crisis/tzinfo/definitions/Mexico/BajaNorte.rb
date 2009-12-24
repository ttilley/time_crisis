require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Mexico
      module BajaNorte
        include TimezoneDefinition
        
        linked_timezone 'Mexico/BajaNorte', 'America/Tijuana'
      end
    end
  end
end
