unless defined?(Date)
  begin
    require 'date'
  rescue LoadError
  end
end

require 'third_base'

TimeCrisis = ThirdBase.dup

# add needed bits of active support to time crisis
# necessary now that it uses ThirdBase
require 'time_crisis/support'

require 'time_crisis/meteorological_seasons'
require 'time_crisis/date_range'
require 'time_crisis/named_months'
require 'time_crisis/weekend'
require 'time_crisis/nth_weekday'
require 'time_crisis/holiday'

# TODO: make this less of an ugly hack
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
