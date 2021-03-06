require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Etc
      module GMT__m__3
        include TimezoneDefinition
        
        timezone 'Etc/GMT-3' do |tz|
          tz.offset :o0, 10800, 0, :'GMT-3'
          
        end
      end
    end
  end
end
