require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Virgin
        include TimezoneDefinition
        
        linked_timezone 'America/Virgin', 'America/St_Thomas'
      end
    end
  end
end
