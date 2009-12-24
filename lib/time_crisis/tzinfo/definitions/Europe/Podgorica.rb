require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Podgorica
        include TimezoneDefinition
        
        linked_timezone 'Europe/Podgorica', 'Europe/Belgrade'
      end
    end
  end
end
