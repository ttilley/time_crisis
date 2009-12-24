require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module HST
      include TimezoneDefinition
      
      timezone 'HST' do |tz|
        tz.offset :o0, -36000, 0, :HST
        
      end
    end
  end
end
