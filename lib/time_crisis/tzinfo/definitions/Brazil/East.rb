require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Brazil
      module East
        include TimezoneDefinition
        
        linked_timezone 'Brazil/East', 'America/Sao_Paulo'
      end
    end
  end
end
