require 'third_base'

module TimeCrisis
  include ThirdBase
end

# add needed bits of active support to time crisis
# necessary now that it uses ThirdBase
require 'time_crisis/support'

require 'time_crisis/meteorological_seasons'
require 'time_crisis/date_range'
require 'time_crisis/named_months'
require 'time_crisis/weekend'
require 'time_crisis/nth_weekday'
require 'time_crisis/holiday'
