require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Etc
      module GMT__p__8
        include TimezoneDefinition
        
        timezone 'Etc/GMT+8' do |tz|
          tz.offset :o0, -28800, 0, :'GMT+8'
          
        end
      end
    end
  end
end
