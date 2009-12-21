module TimeCrisis::Support::ReadableInspect
  module Date
    def readable_inspect
      "#<TimeCrisis::Date #{strftime('%Y-%m-%d')}>"
    end

    def self.included(base)
      base.class_eval do
        alias_method :default_inspect, :inspect
        alias_method :inspect, :readable_inspect
      end
    end
  end

  module DateTime
    def readable_inspect
      "#<TimeCrisis::DateTime #{strftime('%Y-%m-%dT%H:%M:%S%Z')}>"
    end

    def self.included(base)
      base.class_eval do
        alias_method :default_inspect, :inspect
        alias_method :inspect, :readable_inspect
      end
    end
  end
end

TimeCrisis::Date.send(:include, TimeCrisis::Support::ReadableInspect::Date)
TimeCrisis::DateTime.send(:include, TimeCrisis::Support::ReadableInspect::DateTime)
