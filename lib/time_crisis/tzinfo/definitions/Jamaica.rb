require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Jamaica
      include TimezoneDefinition
      
      linked_timezone 'Jamaica', 'America/Jamaica'
    end
  end
end
