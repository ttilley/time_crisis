require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Guernsey
        include TimezoneDefinition
        
        linked_timezone 'Europe/Guernsey', 'Europe/London'
      end
    end
  end
end
