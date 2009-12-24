require 'time_crisis/support/values/time_zone'

module TimeCrisis
  class Time
    DATE_FORMATS = {
      :db           => "%Y-%m-%d %H:%M:%S",
      :number       => "%Y%m%d%H%M%S",
      :time         => "%H:%M",
      :short        => "%d %b %H:%M",
      :long         => "%B %d, %Y %H:%M",
      :rfc822       => lambda { |time| time.strftime("%a, %d %b %Y %H:%M:%S #{time.formatted_offset(false)}") }
    }

    def to_formatted_s(format = :default)
      if formatter = DATE_FORMATS[format]
        formatter.respond_to?(:call) ? formatter.call(self).to_s : strftime(formatter)
      else
        to_default_s
      end
    end
    alias_method :to_default_s, :to_s
    alias_method :to_s, :to_formatted_s

    def formatted_offset(colon = true, alternate_utc_string = nil)
      utc? && alternate_utc_string || TimeCrisis::TimeZone.seconds_to_utc_offset(utc_offset, colon)
    end

    def readable_inspect
      "#<TimeCrisis::Time #{self.to_s(:rfc822)}>"
    end
    alias_method :default_inspect, :inspect
    alias_method :inspect, :readable_inspect

    def to_date
      ::Date.new(year, month, day)
    end

    def to_time
      ::Time.at(self.to_i)
    end

    def to_datetime
      ::DateTime.civil(year, month, day, hour, min, sec, Rational(utc_offset, 86400))
    end

    def to_tc_date
      ::TimeCrisis::Date.civil(year, month, day)
    end

    def to_tc_time
      self
    end

    def to_tc_datetime
      ::TimeCrisis::DateTime.civil(year, month, day, hour, min, sec, 0, utc_offset)
    end
  end
end