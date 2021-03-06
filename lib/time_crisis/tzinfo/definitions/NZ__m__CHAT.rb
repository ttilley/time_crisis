require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module NZ__m__CHAT
      include TimezoneDefinition
      
      linked_timezone 'NZ-CHAT', 'Pacific/Chatham'
    end
  end
end
