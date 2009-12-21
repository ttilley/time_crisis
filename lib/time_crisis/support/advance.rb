module TimeCrisis::Support::Advance
  module Date
    def advance(options)
      options = options.dup
      d = self
      d = d >> options.delete(:years) * 12 if options[:years]
      d = d >> options.delete(:months) if options[:months]
      d = d + options.delete(:weeks) * 7 if options[:weeks]
      d = d + options.delete(:days) if options[:days]
      d
    end
  end

  module DateTime
    def advance(options)
      d = to_tc_date.advance(options)
      advanced_by_date = change(:year => d.year, :month => d.month, :day => d.day)
      seconds_to_advance = (options[:seconds] || 0) + (options[:minutes] || 0) * 60 + (options[:hours] || 0) * 3600
      seconds_to_advance == 0 ? advanced_by_date : (advanced_by_date + Rational(seconds_to_advance.round, 86400).to_f)
    end
  end
end

::TimeCrisis::Date.send(:include, TimeCrisis::Support::Advance::Date)
::TimeCrisis::DateTime.send(:include, TimeCrisis::Support::Advance::DateTime)
