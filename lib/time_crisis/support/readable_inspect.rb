module TimeCrisis::Support::ReadableInspect
  module Date
    def readable_inspect
      strftime("%a, %d %b %Y")
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
      to_s(:rfc822)
    end
    
    def self.included(base)
      base.class_eval do
        alias_method :default_inspect, :inspect
        alias_method :inspect, :readable_inspect
      end
    end
  end
end

Date.send(:include, TimeCrisis::Support::ReadableInspect::Date) unless 
  Date.instance_methods.include?('readable_inspect')

DateTime.send(:include, TimeCrisis::Support::ReadableInspect::DateTime) unless 
  DateTime.instance_methods.include?('readable_inspect')
