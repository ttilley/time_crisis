module TimeCrisis::Support::Conversions
  module Ruby
    module Date
      def to_tc_date
        TimeCrisis::Date.civil(year, month, day)
      end

      def to_tc_datetime
        TimeCrisis::DateTime.civil(year, month, day, 0, 0, 0, 0)
      end
    end

    module Time
      def to_tc_date
        TimeCrisis::Date.civil(year, month, day)
      end

      def to_tc_datetime
        TimeCrisis::DateTime.civil(year, month, day, hour, min, sec, 0, utc_offset)
      end
    end

    module DateTime
      def to_tc_date
        TimeCrisis::Date.civil(year, month, day)
      end

      def to_tc_datetime
        TimeCrisis::DateTime.civil(year, month, day, hour, min, sec, 0, (offset * 86400).to_i)
      end
    end

    module String
      def to_tc_date(opts={})
        TimeCrisis::Date.parse(self, opts)
      end

      def to_tc_datetime(opts={})
        TimeCrisis::DateTime.parse(self, opts)
      end
    end
  end

  module Internal
    module Date
      def to_tc_date
        self
      end

      def to_tc_datetime
        TimeCrisis::DateTime.civil(year, month, day, 0, 0, 0, 0)
      end

      def to_date
        ::Date.civil(year, month, day)
      end

      def to_datetime
        ::DateTime.civil(year, month, day, 0, 0, 0, 0)
      end

      def to_time(form = :local)
        ::Time.send(form, year, month, day)
      end
    end

    module DateTime
      def to_tc_date
        TimeCrisis::Date.civil(year, month, day)
      end

      def to_tc_datetime
        self
      end

      def to_date
        ::Date.civil(year, month, day)
      end
    end
  end
end

::TimeCrisis::Date.send(:include, TimeCrisis::Support::Conversions::Internal::Date)
::TimeCrisis::DateTime.send(:include, TimeCrisis::Support::Conversions::Internal::DateTime)

::Date.send(:include, TimeCrisis::Support::Conversions::Ruby::Date) if defined?(::Date)
::Time.send(:include, TimeCrisis::Support::Conversions::Ruby::Time)
::DateTime.send(:include, TimeCrisis::Support::Conversions::Ruby::DateTime) if defined?(::DateTime)
::String.send(:include, TimeCrisis::Support::Conversions::Ruby::String)
