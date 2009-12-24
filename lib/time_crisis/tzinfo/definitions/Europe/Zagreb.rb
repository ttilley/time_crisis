require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Zagreb
        include TimezoneDefinition
        
        linked_timezone 'Europe/Zagreb', 'Europe/Belgrade'
      end
    end
  end
end
