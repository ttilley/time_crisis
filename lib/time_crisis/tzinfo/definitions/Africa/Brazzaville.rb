require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Africa
      module Brazzaville
        include TimezoneDefinition
        
        timezone 'Africa/Brazzaville' do |tz|
          tz.offset :o0, 3668, 0, :LMT
          tz.offset :o1, 3600, 0, :WAT
          
          tz.transition 1911, 12, :o1, 52259093083, 21600
        end
      end
    end
  end
end
