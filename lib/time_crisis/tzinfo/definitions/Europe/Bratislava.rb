require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Europe
      module Bratislava
        include TimezoneDefinition

        linked_timezone 'Europe/Bratislava', 'Europe/Prague'
      end
    end
  end
end
