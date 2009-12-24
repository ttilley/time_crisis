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

      def nth_weekday(h={})
        raise ArgumentError unless h[:nth]
        nth = h[:nth].to_s == 'last' ? 5 : h[:nth]
        
        unless h[:year] && h[:month] && h[:weekday]
          today = self.current
          
          h[:year] ||= today.year
          h[:month] ||= today.month
          h[:weekday] ||= today.wday
        end

        target_month = self.civil(h[:year], h[:month], 1)
        days_in_month = target_month.days_in_month
        target_weekday = h[:weekday].is_a?(Numeric) ? h[:weekday] : @@days_of_the_week[h[:weekday]]
        first_weekday = target_month.wday

        offset = target_weekday > 0 ? target_weekday - first_weekday + 1 : 7 - (first_weekday - 1)
        day = calculate_day_with_offset(nth, offset)

        while day > days_in_month
          nth = nth - 1
          day = calculate_day_with_offset(nth, offset)
        end

        self.civil(h[:year], h[:month], day)
      end

      private

      def calculate_day_with_offset(nth, offset)
        nth == 1 ? (offset > 0 ? offset : 7 + offset) : (7 * (nth - 1)) + offset
      end
    end

    module InstanceMethods
      def nth_weekday(h={})
        h[:year] ||= self.year
        h[:month] ||= self.month
        h[:weekday] ||= self.wday
        self.class.nth_weekday(h)
      end
    end

  end
end

::TimeCrisis::Date.extend(TimeCrisis::NthWeekday::ClassMethods)
::TimeCrisis::Date.send(:include, TimeCrisis::NthWeekday::InstanceMethods)
::TimeCrisis::DateTime.extend(TimeCrisis::NthWeekday::ClassMethods)
::TimeCrisis::DateTime.send(:include, TimeCrisis::NthWeekday::InstanceMethods)
