require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module NZ
      include TimezoneDefinition
      
      linked_timezone 'NZ', 'Pacific/Auckland'
    end
  end
end
