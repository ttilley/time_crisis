require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Etc
      module GMT__m__6
        include TimezoneDefinition
        
        timezone 'Etc/GMT-6' do |tz|
          tz.offset :o0, 21600, 0, :'GMT-6'
          
        end
      end
    end
  end
end