require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Mariehamn
        include TimezoneDefinition
        
        linked_timezone 'Europe/Mariehamn', 'Europe/Helsinki'
      end
    end
  end
end
