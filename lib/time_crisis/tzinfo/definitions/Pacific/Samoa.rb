require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Pacific
      module Samoa
        include TimezoneDefinition
        
        linked_timezone 'Pacific/Samoa', 'Pacific/Pago_Pago'
      end
    end
  end
end
