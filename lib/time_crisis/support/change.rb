module TimeCrisis::Support::Change
  module Date
    def change(options={})
      ::Date.civil(
        options[:year]  || self.year,
        options[:month] || self.month,
        options[:day]   || self.day
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
      last_day = self.class.days_in_month(self.month, self.year)
      change(:day => last_day)
    end
    
    def beginning_of_day
      to_time
    end
    
    def end_of_day
      to_time.end_of_day
    end
  end
  
  module Time
    def change(options={})
      ::Time.send(
        utc? ? :utc_time : :local,
        options[:year]  || year,
        options[:month] || month,
        options[:day]   || day,
        options[:hour]  || hour,
        options[:min]   || (options[:hour] ? 0 : min),
        options[:sec]   || ((options[:hour] || options[:min]) ? 0 : sec),
        options[:usec]  || ((options[:hour] || options[:min] || options[:sec]) ? 0 : usec)
      )
    end
    
    def beginning_of_year
      change(:month => 1, :day => 1, :hour => 0, :min => 0, :sec => 0)
    end
    
    def end_of_year
      change(:month => 12,:day => 31,:hour => 23, :min => 59, :sec => 59)
    end
    
    def beginning_of_month
      change(:day => 1,:hour => 0, :min => 0, :sec => 0, :usec => 0)
    end
    
    def end_of_month
      last_day = self.class.days_in_month(self.month, self.year)
      change(:day => last_day, :hour => 23, :min => 59, :sec => 59, :usec => 999999.999)
    end
    
    def beginning_of_day
      change(:hour => 0, :min => 0, :sec => 0, :usec => 0)
    end
    
    def end_of_day
      change(:hour => 23, :min => 59, :sec => 59, :usec => 999999.999)
    end
  end
  
  module DateTime
    def change(options={})
      ::DateTime.civil(
        options[:year]  || year,
        options[:month] || month,
        options[:day]   || day,
        options[:hour]  || hour,
        options[:min]   || (options[:hour] ? 0 : min),
        options[:sec]   || ((options[:hour] || options[:min]) ? 0 : sec),
        options[:offset]  || offset,
        options[:start]  || start
      )
    end
  end
end

[Date, Time, DateTime].each do |klass|
  unless klass.instance_methods.include?('change')
    klass.send(:include, TimeCrisis::Support::Change.const_get(klass.to_s))
  end
end
