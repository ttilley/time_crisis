module TimeCrisis::Support::Advance
  module Date
    def advance(options)
      options = options.dup
      d = self
      d = d >> options.delete(:years) * 12 if options[:years]
      d = d >> options.delete(:months)     if options[:months]
      d = d +  options.delete(:weeks) * 7  if options[:weeks]
      d = d +  options.delete(:days)       if options[:days]
      d
    end
  end
  
  module Time
    def advance(options)
      unless options[:weeks].nil?
        options[:weeks], partial_weeks = options[:weeks].divmod(1)
        options[:days] = (options[:days] || 0) + 7 * partial_weeks
      end

      unless options[:days].nil?
        options[:days], partial_days = options[:days].divmod(1)
        options[:hours] = (options[:hours] || 0) + 24 * partial_days
      end

      d = to_date.advance(options)
      time_advanced_by_date = change(:year => d.year, :month => d.month, :day => d.day)
      seconds_to_advance = (options[:seconds] || 0) + (options[:minutes] || 0) * 60 + (options[:hours] || 0) * 3600
      seconds_to_advance == 0 ? time_advanced_by_date : time_advanced_by_date.since(seconds_to_advance)
    end
  end
  
  module DateTime
    def advance(options)
      d = to_date.advance(options)
      datetime_advanced_by_date = change(:year => d.year, :month => d.month, :day => d.day)
      seconds_to_advance = (options[:seconds] || 0) + (options[:minutes] || 0) * 60 + (options[:hours] || 0) * 3600
      seconds_to_advance == 0 ? datetime_advanced_by_date : datetime_advanced_by_date.since(seconds_to_advance)
    end
  end
end

[Date, Time, DateTime].each do |klass|
  unless klass.instance_methods.include?('advance')
    klass.send(:include, TimeCrisis::Support::Advance.const_get(klass.to_s))
  end
end
