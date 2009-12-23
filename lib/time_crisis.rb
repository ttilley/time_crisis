require 'date'
require 'time'

require 'third_base'
TimeCrisis = ThirdBase.dup
require 'time_crisis/ext'
TimeCrisis::Time = ::Time.dup
require 'time_crisis/tzinfo'
require 'time_crisis/support'
require 'time_crisis/meteorological_seasons'
require 'time_crisis/date_range'
require 'time_crisis/named_months'
require 'time_crisis/weekend'
require 'time_crisis/nth_weekday'
require 'time_crisis/holiday'

module TimeCrisis
  class DateTime
    ENVMUTEX = Mutex.new
    def for_zone(time_zone)
      ENVMUTEX.synchronize do
        original_zone = ENV['TZ']
        begin
          utc_time = self.to_time.utc
          ENV['TZ'] = time_zone
          utc_time.localtime.to_tc_datetime
        ensure
          ENV['TZ'] = original_zone
        end
      end
    end
  end
end
