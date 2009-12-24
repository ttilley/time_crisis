require 'rational'

module TimeCrisis
  class DateTime
    class << self
      def local_offset
        ::TimeCrisis::Time.local(2007).utc_offset
      end

      def current
        ::TimeCrisis::Time.zone_default ? ::TimeCrisis::Time.zone.now.to_tc_datetime : ::TimeCrisis::Time.now.to_tc_datetime
      end
    end

    def past?
      self < ::TimeCrisis::DateTime.current
    end

    def future?
      self > ::TimeCrisis::DateTime.current
    end

    def seconds_since_midnight
      sec + (min * 60) + (hour * 3600)
    end

    def change(options={})
      ::TimeCrisis::DateTime.civil(
        options[:year] || year,
        options[:month] || month,
        options[:day] || day,
        options[:hour] || hour,
        options[:min] || (options[:hour] ? 0 : min),
        options[:sec] || ((options[:hour] || options[:min]) ? 0 : sec),
        options[:usec] || ((options[:hour] || options[:min] || options[:sec]) ? 0 : usec),
        options[:offset] || offset
      )
    end

    def advance(options)
      d = to_tc_date.advance(options)
      datetime_advanced_by_date = change(:year => d.year, :month => d.month, :day => d.day)
      seconds_to_advance = (options[:seconds] || 0) + (options[:minutes] || 0) * 60 + (options[:hours] || 0) * 3600
      seconds_to_advance == 0 ? datetime_advanced_by_date : datetime_advanced_by_date.since(seconds_to_advance)
    end

    def ago(seconds)
      since(-seconds)
    end

    def since(seconds)
      self + Rational(seconds.round, 86400).to_f
    end
    alias :in :since

    def beginning_of_day
      change(:hour => 0)
    end
    alias :midnight :beginning_of_day
    alias :at_midnight :beginning_of_day
    alias :at_beginning_of_day :beginning_of_day

    def end_of_day
      change(:hour => 23, :min => 59, :sec => 59)
    end

    def utc
      new_offset(0)
    end
    alias_method :getutc, :utc

    def utc?
      offset == 0
    end

    def utc_offset
      offset
    end

    def compare_with_coercion(other)
      other = other.comparable_time if other.respond_to?(:comparable_time)
      other = other.to_tc_datetime unless other.acts_like?(:date)
      compare_without_coercion(other)
    end
    alias_method :compare_without_coercion, :<=>
    alias_method :<=>, :compare_with_coercion
  end
end
