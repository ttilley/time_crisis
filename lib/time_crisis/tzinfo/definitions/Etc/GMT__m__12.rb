require 'time_crisis/tzinfo/timezone_definition'

module TimeCrisis::TZInfo
  module Definitions
    module Etc
      module GMT__m__12
        include TimezoneDefinition
        
        timezone 'Etc/GMT-12' do |tz|
          tz.offset :o0, 43200, 0, :'GMT-12'
          
        end
      end
    end
  end
end
