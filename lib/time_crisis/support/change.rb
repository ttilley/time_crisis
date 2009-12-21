module TimeCrisis::Support::Change
  module Date
    def change(options={})
      TimeCrisis::Date.civil(
              options[:year] || self.year,
              options[:month] || self.month,
              options[:day] || self.day
      )
    end

    def beginning_of_year
      change(:month => 1, :day => 1)
    end

    def end_of_year
      change(:month => 12, :day => 31)
    end

    def beginning_of_month
      change(:day => 1)
    end

    def end_of_month
      last_day = days_in_month
      change(:day => last_day)
    end
  end

  module DateTime
    def change(options={})
      TimeCrisis::DateTime.civil(
              options[:year] || year,
              options[:month] || month,
              options[:day] || day,
              options[:hour] || hour,
              options[:min] || (options[:hour] ? 0 : min),
              options[:sec] || ((options[:hour] || options[:min]) ? 0 : sec),
              options[:usec] || ((options[:hour] || options[:min] || options[:sec]) ? 0 : usec),
              options[:offset] || offset
      )
    end
  end
end

::TimeCrisis::Date.send(:public, :days_in_month)
::TimeCrisis::Date.send(:include,  TimeCrisis::Support::Change::Date)
::TimeCrisis::DateTime.send(:include, TimeCrisis::Support::Change::DateTime)
