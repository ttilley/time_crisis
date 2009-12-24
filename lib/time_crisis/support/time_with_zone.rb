require "time_crisis/support/values/time_zone"
require 'yaml'

module TimeCrisis
  class TimeWithZone
    
    def self.name
      'Time'
    end

    include Comparable
    attr_reader :time_zone

    def initialize(utc_time, time_zone, local_time = nil, period = nil)
      @utc, @time_zone, @time = utc_time, time_zone, local_time
      @period = @utc ? period : get_period_and_ensure_valid_local_time
    end

    def time
      @time ||= period.to_local(@utc)
    end

    def utc
      @utc ||= period.to_utc(@time)
    end
    alias_method :comparable_time, :utc
    alias_method :getgm, :utc
    alias_method :getutc, :utc
    alias_method :gmtime, :utc

    def period
      @period ||= time_zone.period_for_utc(@utc)
    end

    def in_time_zone(new_zone = ::TimeCrisis::Time.zone)
      return self if time_zone == new_zone
      utc.in_time_zone(new_zone)
    end

    def localtime
      utc.getlocal
    end
    alias_method :getlocal, :localtime

    def dst?
      period.dst?
    end
    alias_method :isdst, :dst?

    def utc?
      time_zone.name == 'UTC'
    end
    alias_method :gmt?, :utc?

    def utc_offset
      period.utc_total_offset
    end
    alias_method :gmt_offset, :utc_offset
    alias_method :gmtoff, :utc_offset

    def formatted_offset(colon = true, alternate_utc_string = nil)
      utc? && alternate_utc_string || TimeZone.seconds_to_utc_offset(utc_offset, colon)
    end

    def zone
      period.zone_identifier.to_s
    end

    def inspect
      "#{time.strftime('%a, %d %b %Y %H:%M:%S')} #{zone} #{formatted_offset}"
    end

    def xmlschema(fraction_digits = 0)
      fraction = if fraction_digits > 0
        ".%i" % time.usec.to_s[0, fraction_digits]
      end

      "#{time.strftime("%Y-%m-%dT%H:%M:%S")}#{fraction}#{formatted_offset(true, 'Z')}"
    end
    alias_method :iso8601, :xmlschema

    def to_yaml(options = {})
      if options.kind_of?(YAML::Emitter)
        utc.to_yaml(options)
      else
        time.to_yaml(options).gsub('Z', formatted_offset(true, 'Z'))
      end
    end

    def httpdate
      utc.httpdate
    end

    def rfc2822
      to_s(:rfc822)
    end
    alias_method :rfc822, :rfc2822

    def to_s(format = :default)
      if format == :db
        utc.to_s(format)
      elsif formatter = ::TimeCrisis::Time::DATE_FORMATS[format]
        formatter.respond_to?(:call) ? formatter.call(self).to_s : strftime(formatter)
      else
        "#{time.strftime("%Y-%m-%d %H:%M:%S")} #{formatted_offset(false, 'UTC')}"
      end
    end
    alias_method :to_formatted_s, :to_s

    def strftime(format)
      format = format.gsub('%Z', zone).gsub('%z', formatted_offset(false))
      time.strftime(format)
    end

    def <=>(other)
      utc <=> other
    end

    def between?(min, max)
      utc.between?(min, max)
    end

    def past?
      utc.past?
    end

    def today?
      time.today?
    end

    def future?
      utc.future?
    end

    def eql?(other)
      utc == other
    end

    def +(other)
      if duration_of_variable_length?(other)
        method_missing(:+, other)
      else
        result = utc.acts_like?(:date) ? utc.since(other) : utc + other rescue utc.since(other)
        result.in_time_zone(time_zone)
      end
    end

    def -(other)
      if other.acts_like?(:time)
        utc.to_f - other.to_f
      elsif duration_of_variable_length?(other)
        method_missing(:-, other)
      else
        result = utc.acts_like?(:date) ? utc.ago(other) : utc - other rescue utc.ago(other)
        result.in_time_zone(time_zone)
      end
    end

    def since(other)
      if duration_of_variable_length?(other)
        method_missing(:since, other)
      else
        utc.since(other).in_time_zone(time_zone)
      end
    end

    def ago(other)
      since(-other)
    end

    def advance(options)
      if options.values_at(:years, :weeks, :months, :days).any?
        method_missing(:advance, options)
      else
        utc.advance(options).in_time_zone(time_zone)
      end
    end

    %w(year mon month day mday wday yday hour min sec to_date to_tc_date).each do |method_name|
      class_eval <<-EOV, __FILE__, __LINE__ + 1
        def #{method_name}    # def month
          time.#{method_name} #   time.month
        end                   # end
      EOV
    end

    def usec
      time.respond_to?(:usec) ? time.usec : 0
    end

    def to_a
      [time.sec, time.min, time.hour, time.day, time.mon, time.year, time.wday, time.yday, dst?, zone]
    end

    def to_f
      utc.to_f
    end

    def to_i
      utc.to_i
    end
    alias_method :hash, :to_i
    alias_method :tv_sec, :to_i

    def to_time
      self
    end
    
    def to_tc_time
      self
    end

    def to_datetime
      utc.to_datetime.new_offset(Rational(utc_offset, 86_400))
    end
    
    def to_tc_datetime
      ::TimeCrisis::DateTime.civil(utc.year, utc.month, utc.day, utc.hour, utc.min, utc.sec, 0, utc_offset)
    end

    def acts_like_time?
      true
    end

    def is_a?(klass)
      klass == ::Time || klass == ::TimeCrisis::Time || super
    end
    alias_method :kind_of?, :is_a?

    def freeze
      period; utc; time
      super
    end

    def marshal_dump
      [utc, time_zone.name, time]
    end

    def marshal_load(variables)
      initialize(variables[0].utc, ::TimeCrisis::Time.__send__(:get_zone, variables[1]), variables[2].utc)
    end

    def respond_to?(sym, include_priv = false)
      return false if sym.to_s == 'acts_like_date?'
      super || time.respond_to?(sym, include_priv)
    end

    def method_missing(sym, *args, &block)
      result = time.__send__(sym, *args, &block)
      result.acts_like?(:time) ? self.class.new(nil, time_zone, result) : result
    end

    private
    def get_period_and_ensure_valid_local_time
      @time = transfer_time_values_to_utc_constructor(@time) unless @time.utc?
      begin
        @time_zone.period_for_local(@time)
      rescue ::TimeCrisis::TZInfo::PeriodNotFound
        @time += 1.hour
        retry
      end
    end

    def transfer_time_values_to_utc_constructor(time)
      ::TimeCrisis::Time.utc_time(time.year, time.month, time.day, time.hour, time.min, time.sec, time.respond_to?(:usec) ? time.usec : 0)
    end

    def duration_of_variable_length?(obj)
      TimeCrisis::Duration === obj && obj.parts.any? {|p| [:years, :months, :days].include? p[0] }
    end
  end
end
