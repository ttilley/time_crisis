require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Kwajalein
      include TimezoneDefinition
      
      linked_timezone 'Kwajalein', 'Pacific/Kwajalein'
    end
  end
end
