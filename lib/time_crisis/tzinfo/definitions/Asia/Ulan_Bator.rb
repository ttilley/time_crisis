require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Ulan_Bator
        include TimezoneDefinition
        
        linked_timezone 'Asia/Ulan_Bator', 'Asia/Ulaanbaatar'
      end
    end
  end
end
