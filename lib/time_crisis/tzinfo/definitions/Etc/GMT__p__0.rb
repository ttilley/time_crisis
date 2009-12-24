require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Etc
      module GMT__p__0
        include TimezoneDefinition
        
        linked_timezone 'Etc/GMT+0', 'Etc/GMT'
      end
    end
  end
end
