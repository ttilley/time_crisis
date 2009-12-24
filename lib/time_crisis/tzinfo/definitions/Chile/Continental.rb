require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Chile
      module Continental
        include TimezoneDefinition
        
        linked_timezone 'Chile/Continental', 'America/Santiago'
      end
    end
  end
end
