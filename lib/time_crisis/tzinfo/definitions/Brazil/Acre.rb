require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Brazil
      module Acre
        include TimezoneDefinition
        
        linked_timezone 'Brazil/Acre', 'America/Rio_Branco'
      end
    end
  end
end
