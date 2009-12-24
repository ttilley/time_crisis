require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Pacific
      module Yap
        include TimezoneDefinition
        
        linked_timezone 'Pacific/Yap', 'Pacific/Truk'
      end
    end
  end
end
