module TimeCrisis
  class DateTime
    def to_formatted_s(format = :default)
      if formatter = ::TimeCrisis::Time::DATE_FORMATS[format]
        formatter.respond_to?(:call) ? formatter.call(self).to_s : strftime(formatter)
      else
        to_default_s
      end
    end
    alias_method :to_default_s, :to_s unless (instance_methods(false) & [:to_s, 'to_s']).empty?
    alias_method :to_s, :to_formatted_s

    def formatted_offset(colon = true, alternate_utc_string = nil)
      utc? && alternate_utc_string || TimeCrisis::TimeZone.seconds_to_utc_offset(utc_offset, colon)
    end

    def readable_inspect
      "#<TimeCrisis::DateTime #{self.to_s(:rfc822)}>"
    end
    alias_method :default_inspect, :inspect
    alias_method :inspect, :readable_inspect

    def to_date
      ::Date.civil(year, month, day)
    end

    def to_tc_date
      ::TimeCrisis::Date.civil(year, month, day)
    end

    def to_tc_datetime
      self
    end

    def to_datetime
      ::DateTime.civil(year, month, day, hour, min, second, Rational(offset, 86400))
    end

    def to_time
      ::Time.at(self.to_f)
    end
    
    def to_tc_time
      ::TimeCrisis::Time.at(self.to_f)
    end

    def xmlschema
      strftime("%Y-%m-%dT%H:%M:%S%Z")
    end

    def to_f
      seconds_since_unix_epoch.to_f
    end

    def to_i
      seconds_since_unix_epoch.to_i
    end

    private

    def seconds_since_unix_epoch
      seconds_per_day = 86_400
      (self.utc - ::TimeCrisis::DateTime.civil(1970, 1, 1)) * seconds_per_day
    end
  end
end
