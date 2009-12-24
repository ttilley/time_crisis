require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Skopje
        include TimezoneDefinition
        
        linked_timezone 'Europe/Skopje', 'Europe/Belgrade'
      end
    end
  end
end
