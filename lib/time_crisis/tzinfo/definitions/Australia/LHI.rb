require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Australia
      module LHI
        include TimezoneDefinition
        
        linked_timezone 'Australia/LHI', 'Australia/Lord_Howe'
      end
    end
  end
end
