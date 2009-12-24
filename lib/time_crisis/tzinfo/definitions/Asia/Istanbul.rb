require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Asia
      module Istanbul
        include TimezoneDefinition
        
        linked_timezone 'Asia/Istanbul', 'Europe/Istanbul'
      end
    end
  end
end
