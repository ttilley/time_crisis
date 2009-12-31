module TimeCrisis
  class Date
    def to_json(options = nil)
      %("#{strftime("%Y-%m-%d")}")
    end
  end

  class DateTime
    def to_json(options = nil)
      xmlschema.inspect
    end
  end

  class Time
    def to_json(options = nil)
      xmlschema.inspect
    end
  end
end