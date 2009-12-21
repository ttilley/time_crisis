module TimeCrisis::Support::Current
  module Date
    def current
      today
    end
  end

  module DateTime
    def current
      now
    end
  end
end

::TimeCrisis::Date.extend(TimeCrisis::Support::Current::Date)
::TimeCrisis::DateTime.extend(TimeCrisis::Support::Current::DateTime)
