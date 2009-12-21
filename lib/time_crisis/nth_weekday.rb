module TimeCrisis
  module NthWeekday
    module ClassMethods
      @@days_of_the_week = {
        :sunday => 0,
        :monday => 1,
        :tuesday => 2,
        :wednesday => 3,
        :thursday => 4,
        :friday => 5,
        :saturday => 6
      }

      def nth_weekday(h={:year, :month, :weekday, :nth})
        raise ArgumentError unless h.include?(:nth)
        today = TimeCrisis::Date.today
        h[:year] ||= today.year
        h[:month] ||= today.month
        h[:weekday] ||= today.wday
        
        target_weekday = @@days_of_the_week[h[:weekday]]
        first_weekday = TimeCrisis::Date.new(h[:year], h[:month], 1).wday
        offset = target_weekday > 0 ? target_weekday - first_weekday + 1 : 7 - (first_weekday - 1)
        day = (7 * (h[:nth] - 1)) + offset
        TimeCrisis::Date.new(h[:year], h[:month], day)
      end
    end
    
    module InstanceMethods
      def nth_weekday(h={:year, :month, :weekday, :nth})
        h[:year] ||= self.year
        h[:month] ||= self.month
        h[:weekday] ||= self.wday
        self.class.nth_weekday(h)
      end
    end

  end
end

TimeCrisis::Date.extend(TimeCrisis::NthWeekday::ClassMethods)
TimeCrisis::Date.send(:include, TimeCrisis::NthWeekday::InstanceMethods)
TimeCrisis::DateTime.extend(TimeCrisis::NthWeekday::ClassMethods)
TimeCrisis::DateTime.send(:include, TimeCrisis::NthWeekday::InstanceMethods)
