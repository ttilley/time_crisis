require 'time_crisis/time'
require 'time_crisis/date'
require 'time_crisis/datetime'
require 'time_crisis/tzinfo'
require 'time_crisis/support'
require 'time_crisis/conversions'
require 'time_crisis/to_json'
require 'time_crisis/date_range'
require 'time_crisis/named_months'
require 'time_crisis/meteorological_seasons'
require 'time_crisis/weekend'
require 'time_crisis/nth_weekday'
require 'time_crisis/holiday'

::TimeCrisis::Time.zone_default = ::Time.zone_default if ::Time.respond_to?(:zone_default)
::TimeCrisis::Time.zone = ::Time.zone if ::Time.respond_to?(:zone)
::TimeCrisis::Time.zone ||= ::Time.now.zone

# not sure about making this a default behavior
def TCTime
  TimeCrisis::Time
end
def TCDate
  TimeCrisis::Date
end
def TCDateTime
  TimeCrisis::DateTime
end
