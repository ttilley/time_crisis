require 'time_crisis/tzinfo/offset_rationals'

module TimeCrisis
  module TZInfo
    # Used by TZInfo internally to represent either a Time, DateTime or integer
    # timestamp (seconds since 1970-01-01 00:00:00).
    class TimeOrDateTime #:nodoc:
      include Comparable

      # Constructs a new TimeOrDateTime. timeOrDateTime can be a Time, DateTime
      # or an integer. If using a Time or DateTime, any time zone information is
      # ignored.
      def initialize(timeOrDateTime)
        @time = nil
        @tctime = nil
        @datetime = nil
        @tcdatetime = nil
        @timestamp = nil

        if timeOrDateTime.is_a?(::TimeCrisis::Time)
          @tctime = timeOrDateTime
          @tctime = ::TimeCrisis::Time.utc(@tctime.year, @tctime.mon, @tctime.mday, @tctime.hour, @tctime.min, @tctime.sec) unless @tctime.zone == 'UTC'
          @orig = @tctime
        elsif timeOrDateTime.is_a?(::Time)
          @time = timeOrDateTime
          @time = ::Time.utc(@time.year, @time.mon, @time.mday, @time.hour, @time.min, @time.sec) unless @time.zone == 'UTC'
          @orig = @time
        elsif timeOrDateTime.is_a?(::TimeCrisis::DateTime)
          @tcdatetime = timeOrDateTime
          @tcdatetime = @tcdatetime.new_offset(0) unless @tcdatetime.offset == 0
          @orig = @tcdatetime
        elsif timeOrDateTime.is_a?(::DateTime)
          @datetime = timeOrDateTime
          @datetime = @datetime.new_offset(0) unless @datetime.offset == 0
          @orig = @datetime
        else
          @timestamp = timeOrDateTime.to_i
          @orig = @timestamp
        end
      end

      # Returns the time as a Time.
      def to_time
        unless @time
          if @timestamp
            @time = ::Time.at(@timestamp).utc
          else
            @time = ::Time.utc(year, mon, mday, hour, min, sec)
          end
        end

        @time
      end
      
      def to_tc_time
        unless @tctime
          if @timestamp
            @tctime = ::TimeCrisis::Time.at(@timestamp).utc
          else
            @tctime = ::TimeCrisis::Time.utc(year, mon, mday, hour, min, sec)
          end
        end
        
        @tctime
      end

      # Returns the time as a DateTime.
      def to_datetime
        unless @datetime
          @datetime = ::DateTime.civil(year, mon, mday, hour, min, sec)
        end

        @datetime
      end

      # returns the time as a TimeCrisis::DateTime
      def to_tc_datetime
        unless @tcdatetime
          @tcdatetime = ::TimeCrisis::DateTime.civil(year, mon, mday, hour, min, sec)
        end

        @tcdatetime
      end

      # Returns the time as an integer timestamp.
      def to_i
        unless @timestamp
          @timestamp = to_tc_time.to_i
        end

        @timestamp
      end

      # Returns the time as the original time passed to new.
      def to_orig
        @orig
      end

      # Returns a string representation of the TimeOrDateTime.
      def to_s
        if @orig.is_a?(::TimeCrisis::Time)
          "TimeCrisis::Time: #{@orig.to_s}"
        elsif @orig.is_a?(::Time)
          "Time: #{@orig.to_s}"
        elsif @orig.is_a?(::TimeCrisis::DateTime)
          "TimeCrisis::DateTime: #{@orig.to_s}"
        elsif @orig.is_a?(::DateTime)
          "DateTime: #{@orig.to_s}"
        else
          "Timestamp: #{@orig.to_s}"
        end
      end

      # Returns internal object state as a programmer-readable string.
      def inspect
        "#<#{self.class}: #{@orig.inspect}>"
      end

      # Returns the year.
      def year
        if @tctime
          @tctime.year
        elsif @time
          @time.year
        elsif @datetime
          @datetime.year
        elsif @tcdatetime
          @tcdatetime.year
        else
          to_tc_time.year
        end
      end

      # Returns the month of the year (1..12).
      def mon
        if @tctime
          @tctime.mon
        elsif @time
          @time.mon
        elsif @datetime
          @datetime.mon
        elsif @tcdatetime
          @tcdatetime.mon
        else
          to_tc_time.mon
        end
      end

      alias :month :mon

      # Returns the day of the month (1..n).
      def mday
        if @tctime
          @tctime.mday
        elsif @time
          @time.mday
        elsif @datetime
          @datetime.mday
        elsif @tcdatetime
          @tcdatetime.mday
        else
          to_tc_time.mday
        end
      end

      alias :day :mday

      # Returns the hour of the day (0..23).
      def hour
        if @tctime
          @tctime.hour
        elsif @time
          @time.hour
        elsif @datetime
          @datetime.hour
        elsif @tcdatetime
          @tcdatetime.hour
        else
          to_tc_time.hour
        end
      end

      # Returns the minute of the hour (0..59).
      def min
        if @tctime
          @tctime.min
        elsif @time
          @time.min
        elsif @datetime
          @datetime.min
        elsif @tcdatetime
          @tcdatetime.min
        else
          to_tc_time.min
        end
      end

      # Returns the second of the minute (0..60). (60 for a leap second).
      def sec
        if @tctime
          @tctime.sec
        elsif @time
          @time.sec
        elsif @datetime
          @datetime.sec
        elsif @tcdatetime
          @tcdatetime.sec
        else
          to_tc_time.sec
        end
      end

      # Compares this TimeOrDateTime with another Time, DateTime, integer
      # timestamp or TimeOrDateTime. Returns -1, 0 or +1 depending whether the
      # receiver is less than, equal to, or greater than timeOrDateTime.
      #
      # Milliseconds and smaller units are ignored in the comparison.
      def <=>(timeOrDateTime)
        if timeOrDateTime.is_a?(TimeOrDateTime)
          orig = timeOrDateTime.to_orig

          if @orig.is_a?(::TimeCrisis::DateTime) || orig.is_a?(::TimeCrisis::DateTime)
            to_tc_datetime <=> timeOrDateTime.to_tc_datetime
          elsif @orig.is_a?(::DateTime) || orig.is_a?(::DateTime)
            # If either is a DateTime, assume it is there for a reason
            # (i.e. for range).
            to_datetime <=> timeOrDateTime.to_datetime
          elsif orig.is_a?(::TimeCrisis::Time)
            to_tc_time <=> timeOrDateTime.to_tc_time
          elsif orig.is_a?(::Time)
            to_time <=> timeOrDateTime.to_time
          else
            to_i <=> timeOrDateTime.to_i
          end
        elsif @orig.is_a?(::TimeCrisis::DateTime) || timeOrDateTime.is_a?(::TimeCrisis::DateTime)
          to_tc_datetime <=> TimeOrDateTime.wrap(timeOrDateTime).to_tc_datetime
        elsif @orig.is_a?(::DateTime) || timeOrDateTime.is_a?(::DateTime)
          # If either is a DateTime, assume it is there for a reason
          # (i.e. for range).
          to_datetime <=> TimeOrDateTime.wrap(timeOrDateTime).to_datetime
        elsif timeOrDateTime.is_a?(::TimeCrisis::Time)
          to_tc_time <=> timeOrDateTime
        elsif timeOrDateTime.is_a?(::Time)
          to_time <=> timeOrDateTime
        else
          to_i <=> timeOrDateTime.to_i
        end
      end

      # Adds a number of seconds to the TimeOrDateTime. Returns a new
      # TimeOrDateTime, preserving what the original constructed type was.
      # If the original type is a Time and the resulting calculation goes out of
      # range for Times, then an exception will be raised by the Time class.
      def +(seconds)
        if seconds == 0
          self
        else
          if @orig.is_a?(::TimeCrisis::DateTime)
            TimeOrDateTime.new(@orig + OffsetRationals.rational_for_offset(seconds).to_f)
          elsif @orig.is_a?(::DateTime)
            TimeOrDateTime.new(@orig + OffsetRationals.rational_for_offset(seconds))
          else
            # + defined for Time and integer timestamps
            TimeOrDateTime.new(@orig + seconds)
          end
        end
      end

      # Subtracts a number of seconds from the TimeOrDateTime. Returns a new
      # TimeOrDateTime, preserving what the original constructed type was.
      # If the original type is a Time and the resulting calculation goes out of
      # range for Times, then an exception will be raised by the Time class.
      def -(seconds)
        self + (-seconds)
      end

      # Similar to the + operator, but for cases where adding would cause a
      # timestamp or time to go out of the allowed range, converts to a DateTime
      # based TimeOrDateTime.
      def add_with_convert(seconds)
        if seconds == 0
          self
        else
          if @orig.is_a?(::TimeCrisis::DateTime)
            TimeOrDateTime.new(@orig + OffsetRationals.rational_for_offset(seconds).to_f)
          elsif @orig.is_a?(::DateTime)
            TimeOrDateTime.new(@orig + OffsetRationals.rational_for_offset(seconds))
          else
            # A Time or timestamp.
            result = to_i + seconds

            if result < 0 || result > 2147483647
              result = TimeOrDateTime.new(to_tc_datetime + OffsetRationals.rational_for_offset(seconds).to_f)
            else
              result = TimeOrDateTime.new(@orig + seconds)
            end
          end
        end
      end

      # Returns true if todt represents the same time and was originally
      # constructed with the same type (DateTime, Time or timestamp) as this
      # TimeOrDateTime.
      def eql?(todt)
        todt.respond_to?(:to_orig) && to_orig.eql?(todt.to_orig)
      end

      # Returns a hash of this TimeOrDateTime.
      def hash
        @orig.hash
      end

      # If no block is given, returns a TimeOrDateTime wrapping the given
      # timeOrDateTime. If a block is specified, a TimeOrDateTime is constructed
      # and passed to the block. The result of the block must be a TimeOrDateTime.
      # to_orig will be called on the result and the result of to_orig will be
      # returned.
      #
      # timeOrDateTime can be a Time, DateTime, integer timestamp or TimeOrDateTime.
      # If a TimeOrDateTime is passed in, no new TimeOrDateTime will be constructed,
      # the passed in value will be used.
      def self.wrap(timeOrDateTime)
        t = timeOrDateTime.is_a?(TimeOrDateTime) ? timeOrDateTime : TimeOrDateTime.new(timeOrDateTime)

        if block_given?
          t = yield t

          if timeOrDateTime.is_a?(TimeOrDateTime)
            t
          elsif timeOrDateTime.is_a?(::TimeCrisis::Time)
            t.to_tc_time
          elsif timeOrDateTime.is_a?(::Time)
            t.to_time
          elsif timeOrDateTime.is_a?(::TimeCrisis::DateTime)
            t.to_tc_datetime
          elsif timeOrDateTime.is_a?(::DateTime)
            t.to_datetime
          else
            t.to_i
          end
        else
          t
        end
      end
    end
  end
end
