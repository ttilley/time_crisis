require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Mideast
      module Riyadh88
        include TimezoneDefinition
        
        linked_timezone 'Mideast/Riyadh88', 'Asia/Riyadh88'
      end
    end
  end
end
