module TimeCrisis
  class Date
    DATE_FORMATS = {
      :short        => "%e %b",
      :long         => "%B %e, %Y",
      :db           => "%Y-%m-%d",
      :number       => "%Y%m%d",
      :rfc822       => "%e %b %Y"
    }

    def to_formatted_s(format = :default)
      if formatter = DATE_FORMATS[format]
        if formatter.respond_to?(:call)
          formatter.call(self).to_s
        else
          strftime(formatter)
        end
      else
        to_default_s
      end
    end
    alias_method :to_default_s, :to_s
    alias_method :to_s, :to_formatted_s

    def readable_inspect
      "#<TimeCrisis::Date #{strftime('%a, %d %b %Y')}>"
    end
    alias_method :default_inspect, :inspect
    alias_method :inspect, :readable_inspect

    def to_tc_date
      self
    end

    def to_tc_datetime
      ::TimeCrisis::DateTime.civil(year, month, day, 0, 0, 0, 0)
    end
    
    def to_tc_time(form = :local)
      ::TimeCrisis::Time.send(form, year, month, day)
    end

    def to_date
      ::Date.civil(year, month, day)
    end

    def to_datetime
      ::DateTime.civil(year, month, day, 0, 0, 0, 0)
    end

    def to_time(form = :local)
      ::Time.send(form, year, month, day)
    end

    def xmlschema
      to_tc_datetime.xmlschema
    end

  end
end
