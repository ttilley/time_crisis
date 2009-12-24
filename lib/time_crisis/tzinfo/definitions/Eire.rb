require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Eire
      include TimezoneDefinition
      
      linked_timezone 'Eire', 'Europe/Dublin'
    end
  end
end
