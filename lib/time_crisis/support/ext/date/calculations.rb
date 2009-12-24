require 'time_crisis/support/duration'
require 'time_crisis/support/ext/time/zones'

module TimeCrisis
  class Date
    class << self
      def yesterday
        ::TimeCrisis::Date.today.yesterday
      end

      def tomorrow
        ::TimeCrisis::Date.today.tomorrow
      end

      def current
        ::TimeCrisis::Time.zone_default ? ::TimeCrisis::Time.zone.today : ::TimeCrisis::Date.today
      end
    end

    def past?
      self < ::TimeCrisis::Date.current
    end

    def today?
      self.to_tc_date == ::TimeCrisis::Date.current
    end

    def future?
      self > ::TimeCrisis::Date.current
    end

    def ago(seconds)
      to_tc_time.since(-seconds)
    end

    def since(seconds)
      to_tc_time.since(seconds)
    end
    alias :in :since

    def beginning_of_day
      to_tc_time
    end
    alias :midnight :beginning_of_day
    alias :at_midnight :beginning_of_day
    alias :at_beginning_of_day :beginning_of_day

    def end_of_day
      to_tc_time.end_of_day
    end

    def plus_with_duration(other) #:nodoc:
      if TimeCrisis::Duration === other
        other.since(self)
      else
        plus_without_duration(other)
      end
    end
    alias_method :plus_without_duration, :+
    alias_method :+, :plus_with_duration

    def minus_with_duration(other) #:nodoc:
      if TimeCrisis::Duration === other
        plus_with_duration(-other)
      else
        minus_without_duration(other)
      end
    end
    alias_method :minus_without_duration, :-
    alias_method :-, :minus_with_duration

    def advance(options)
      options = options.dup
      d = self
      d = d >> options.delete(:years) * 12 if options[:years]
      d = d >> options.delete(:months)     if options[:months]
      d = d +  options.delete(:weeks) * 7  if options[:weeks]
      d = d +  options.delete(:days)       if options[:days]
      d
    end

    def change(options)
      ::TimeCrisis::Date.civil(
        options[:year]  || self.year,
        options[:month] || self.month,
        options[:day]   || self.day
      )
    end

    def months_ago(months)
      advance(:months => -months)
    end

    def months_since(months)
      advance(:months => months)
    end

    def years_ago(years)
      advance(:years => -years)
    end

    def years_since(years)
      advance(:years => years)
    end

    def last_year
      years_ago(1)
    end

    def next_year
      years_since(1)
    end unless method_defined?(:next_year)

    def last_month
      months_ago(1)
    end

    def next_month
      months_since(1)
    end unless method_defined?(:next_month)

    def beginning_of_week
      days_to_monday = self.wday!=0 ? self.wday-1 : 6
      result = self - days_to_monday
      self.acts_like?(:time) ? result.midnight : result
    end
    alias :monday :beginning_of_week
    alias :at_beginning_of_week :beginning_of_week

    def end_of_week
      days_to_sunday = self.wday!=0 ? 7-self.wday : 0
      result = self + days_to_sunday.days
      self.acts_like?(:time) ? result.end_of_day : result
    end
    alias :at_end_of_week :end_of_week

    def next_week(day = :monday)
      days_into_week = { :monday => 0, :tuesday => 1, :wednesday => 2, :thursday => 3, :friday => 4, :saturday => 5, :sunday => 6}
      result = (self + 7).beginning_of_week + days_into_week[day]
      self.acts_like?(:time) ? result.change(:hour => 0) : result
    end

    def beginning_of_month
      self.acts_like?(:time) ? change(:day => 1,:hour => 0, :min => 0, :sec => 0) : change(:day => 1)
    end
    alias :at_beginning_of_month :beginning_of_month

    def end_of_month
      last_day = ::TimeCrisis::Time.days_in_month( self.month, self.year )
      self.acts_like?(:time) ? change(:day => last_day, :hour => 23, :min => 59, :sec => 59) : change(:day => last_day)
    end
    alias :at_end_of_month :end_of_month

    def beginning_of_quarter
      beginning_of_month.change(:month => [10, 7, 4, 1].detect { |m| m <= self.month })
    end
    alias :at_beginning_of_quarter :beginning_of_quarter

    def end_of_quarter
      beginning_of_month.change(:month => [3, 6, 9, 12].detect { |m| m >= self.month }).end_of_month
    end
    alias :at_end_of_quarter :end_of_quarter

    def beginning_of_year
      self.acts_like?(:time) ? change(:month => 1, :day => 1, :hour => 0, :min => 0, :sec => 0) : change(:month => 1, :day => 1)
    end
    alias :at_beginning_of_year :beginning_of_year

    def end_of_year
      self.acts_like?(:time) ? change(:month => 12,:day => 31,:hour => 23, :min => 59, :sec => 59) : change(:month => 12, :day => 31)
    end
    alias :at_end_of_year :end_of_year

    def yesterday
      self - 1
    end

    def tomorrow
      self + 1
    end
  end

end