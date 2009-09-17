module TimeCrisis::Support::Current
  module Time
    def current
      now
    end
  end

  module Date
    def current
      today
    end
  end

  module DateTime
    def current
      ::Time.now.to_datetime
    end
  end
end

Time.extend(TimeCrisis::Support::Current::Time) unless Time.respond_to?(:current)
Date.extend(TimeCrisis::Support::Current::Date) unless Date.respond_to?(:current)
DateTime.extend(TimeCrisis::Support::Current::DateTime) unless DateTime.respond_to?(:current)
