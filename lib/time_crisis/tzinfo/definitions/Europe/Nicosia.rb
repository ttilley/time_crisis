require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Nicosia
        include TimezoneDefinition
        
        linked_timezone 'Europe/Nicosia', 'Asia/Nicosia'
      end
    end
  end
end
