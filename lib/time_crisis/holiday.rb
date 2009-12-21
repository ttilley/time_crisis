module TimeCrisis::Holiday
  class << self
    def presidents_day
      third_monday_of_feb = TimeCrisis::Date.nth_weekday({
        :month => 2,
        :weekday => :monday,
        :nth => 3
      })
      
      [third_monday_of_feb.month, third_monday_of_feb.day]
    end
    
    def memorial_day
      last_monday_of_may = TimeCrisis::Date.nth_weekday({
        :month => 5,
        :weekday => :monday,
        :nth => 4
      })
      
      [last_monday_of_may.month, last_monday_of_may.day]
    end
    
    def labor_day
      first_monday_in_sept = TimeCrisis::Date.nth_weekday({
        :month => 9,
        :weekday => :monday,
        :nth => 1
      })
      
      [first_monday_in_sept.month, first_monday_in_sept.day]
    end
    
    def veterans_day
      day = nil
      
      nov11 = TimeCrisis::Date.today.change({
        :month => 11,
        :day => 11
      })
      
      # Veterans day is usually observed on November 11. However, if it occurs
      # on a Sunday then the following Monday is designated for holiday leave, 
      # and if it occurs Saturday then either Saturday or Friday may be so 
      # designated.
      if nov11.wday == 0
        day = 12
      elsif nov11.wday == 6
        day = 10
      else
        day = 11
      end
      
      [11, day]
    end
    
    def thanksgiving_day
      fourth_thursday_in_november = TimeCrisis::Date.nth_weekday({
        :month => 9,
        :weekday => :thursday,
        :nth => 4
      })
      
      [fourth_thursday_in_november.month, fourth_thursday_in_november.day]
    end
  end
  
  module InstanceMethods
    def holiday?
      @@holidays ||= {
        :new_years_day => [1,1],
        :presidents_day => TimeCrisis::Holiday.presidents_day,
        :memorial_day => TimeCrisis::Holiday.memorial_day,
        :independence_day => [7,4],
        :labor_day => TimeCrisis::Holiday.labor_day,
        :veterans_day => TimeCrisis::Holiday.veterans_day,
        :thanksgiving_day => TimeCrisis::Holiday.thanksgiving_day,
        :christmas_day => [12,25]
      }

      @@holidays.values.include?([self.month, self.day])
    end
  end
end

TimeCrisis::Date.send(:include, TimeCrisis::InstanceMethods::Holiday)
TimeCrisis::DateTime.send(:include, TimeCrisis::InstanceMethods::Holiday)
