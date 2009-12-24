require 'time_crisis/support/duration'
require 'time_crisis/support/ext/date/acts_like'
require 'time_crisis/support/ext/date/calculations'

module TimeCrisis
  class Time
    DAYS_INTO_WEEK = { :monday => 0, :tuesday => 1, :wednesday => 2, :thursday => 3, :friday => 4, :saturday => 5, :sunday => 6 }

    class << self
      def ===(other)
        other.is_a?(::Time)
      end

      def days_in_month(month, year = now.year)
        ::TimeCrisis::Date.civil(year, month, 1).days_in_month
      end

      def time_with_datetime_fallback(utc_or_local, year, month=1, day=1, hour=0, min=0, sec=0, usec=0)
        ::TimeCrisis::Time.send(utc_or_local, year, month, day, hour, min, sec, usec)
      rescue
        offset = utc_or_local.to_sym == :local ? ::TimeCrisis::DateTime.local_offset : 0
        ::DateTime.civil(year, month, day, hour, min, sec, 0, offset)
      end

      def utc_time(*args)
        time_with_datetime_fallback(:utc, *args)
      end

      def local_time(*args)
        time_with_datetime_fallback(:local, *args)
      end
    end

    def past?
      self < ::TimeCrisis::Time.current
    end

    def today?
      to_tc_date == ::TimeCrisis::Date.current
    end

    def future?
      self > ::TimeCrisis::Time.current
    end

    def seconds_since_midnight
      to_i - change(:hour => 0).to_i + (usec / 1.0e+6)
    end

    def change(options)
      ::TimeCrisis::Time.send(
        utc? ? :utc_time : :local_time,
        options[:year]  || year,
        options[:month] || month,
        options[:day]   || day,
        options[:hour]  || hour,
        options[:min]   || (options[:hour] ? 0 : min),
        options[:sec]   || ((options[:hour] || options[:min]) ? 0 : sec),
        options[:usec]  || ((options[:hour] || options[:min] || options[:sec]) ? 0 : usec)
      )
    end

    def advance(options)
      unless options[:weeks].nil?
        options[:weeks], partial_weeks = options[:weeks].divmod(1)
        options[:days] = (options[:days] || 0) + 7 * partial_weeks
      end

      unless options[:days].nil?
        options[:days], partial_days = options[:days].divmod(1)
        options[:hours] = (options[:hours] || 0) + 24 * partial_days
      end

      d = to_tc_date.advance(options)
      time_advanced_by_date = change(:year => d.year, :month => d.month, :day => d.day)
      seconds_to_advance = (options[:seconds] || 0) + (options[:minutes] || 0) * 60 + (options[:hours] || 0) * 3600
      seconds_to_advance == 0 ? time_advanced_by_date : time_advanced_by_date.since(seconds_to_advance)
    end

    def ago(seconds)
      since(-seconds)
    end

    def since(seconds)
      self + seconds
    rescue
      to_tc_datetime.since(seconds)
    end
    alias :in :since

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
    end

    def last_month
      months_ago(1)
    end

    def next_month
      months_since(1)
    end

    def beginning_of_week
      days_to_monday = wday!=0 ? wday-1 : 6
      (self - days_to_monday.days).midnight
    end
    alias :monday :beginning_of_week
    alias :at_beginning_of_week :beginning_of_week

    def end_of_week
      days_to_sunday = wday!=0 ? 7-wday : 0
      (self + days_to_sunday.days).end_of_day
    end
    alias :at_end_of_week :end_of_week

    def next_week(day = :monday)
      since(1.week).beginning_of_week.since(DAYS_INTO_WEEK[day].day).change(:hour => 0)
    end

    def beginning_of_day
      change(:hour => 0, :min => 0, :sec => 0, :usec => 0)
    end
    alias :midnight :beginning_of_day
    alias :at_midnight :beginning_of_day
    alias :at_beginning_of_day :beginning_of_day

    def end_of_day
      change(:hour => 23, :min => 59, :sec => 59, :usec => 999999.999)
    end

    def beginning_of_month
      change(:day => 1,:hour => 0, :min => 0, :sec => 0, :usec => 0)
    end
    alias :at_beginning_of_month :beginning_of_month

    def end_of_month
      last_day = ::TimeCrisis::Time.days_in_month(month, year)
      change(:day => last_day, :hour => 23, :min => 59, :sec => 59, :usec => 999999.999)
    end
    alias :at_end_of_month :end_of_month

    def beginning_of_quarter
      beginning_of_month.change(:month => [10, 7, 4, 1].detect { |m| m <= month })
    end
    alias :at_beginning_of_quarter :beginning_of_quarter

    def end_of_quarter
      beginning_of_month.change(:month => [3, 6, 9, 12].detect { |m| m >= month }).end_of_month
    end
    alias :at_end_of_quarter :end_of_quarter

    def beginning_of_year
      change(:month => 1, :day => 1, :hour => 0, :min => 0, :sec => 0, :usec => 0)
    end
    alias :at_beginning_of_year :beginning_of_year

    def end_of_year
      change(:month => 12, :day => 31, :hour => 23, :min => 59, :sec => 59, :usec => 999999.999)
    end
    alias :at_end_of_year :end_of_year

    def yesterday
      advance(:days => -1)
    end

    def tomorrow
      advance(:days => 1)
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
        other.until(self)
      else
        minus_without_duration(other)
      end
    end
    alias_method :minus_without_duration, :-
    alias_method :-, :minus_with_duration

    def minus_with_coercion(other)
      other = other.comparable_time if other.respond_to?(:comparable_time)
      minus_without_coercion(other)
    end
    alias_method :minus_without_coercion, :-
    alias_method :-, :minus_with_coercion

    def compare_with_coercion(other)
      other = other.comparable_time if other.respond_to?(:comparable_time)
      if other.acts_like?(:date)
        to_tc_datetime.compare_without_coercion(other)
      else
        compare_without_coercion(other)
      end
    end
    alias_method :compare_without_coercion, :<=>
    alias_method :<=>, :compare_with_coercion
  end
end
