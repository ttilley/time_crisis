require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module US
      module Samoa
        include TimezoneDefinition
        
        linked_timezone 'US/Samoa', 'Pacific/Pago_Pago'
      end
    end
  end
end
