require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Etc
      module GMT__m__9
        include TimezoneDefinition
        
        timezone 'Etc/GMT-9' do |tz|
          tz.offset :o0, 32400, 0, :'GMT-9'
          
        end
      end
    end
  end
end
