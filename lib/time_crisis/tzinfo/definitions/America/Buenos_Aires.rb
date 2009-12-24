require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module America
      module Buenos_Aires
        include TimezoneDefinition
        
        linked_timezone 'America/Buenos_Aires', 'America/Argentina/Buenos_Aires'
      end
    end
  end
end
