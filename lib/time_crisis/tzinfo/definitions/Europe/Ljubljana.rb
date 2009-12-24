require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Ljubljana
        include TimezoneDefinition
        
        linked_timezone 'Europe/Ljubljana', 'Europe/Belgrade'
      end
    end
  end
end
