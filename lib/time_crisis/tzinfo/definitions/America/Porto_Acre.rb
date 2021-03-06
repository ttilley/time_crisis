require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Porto_Acre
        include TimezoneDefinition
        
        linked_timezone 'America/Porto_Acre', 'America/Rio_Branco'
      end
    end
  end
end
