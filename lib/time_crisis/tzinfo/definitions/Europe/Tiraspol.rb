require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Tiraspol
        include TimezoneDefinition
        
        linked_timezone 'Europe/Tiraspol', 'Europe/Chisinau'
      end
    end
  end
end
