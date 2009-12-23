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

      def xmlschema
        to_tc_datetime.xmlschema
      end
    end

    module DateTime
      def to_tc_date
        TimeCrisis::Date.civil(year, month, day)
      end

      def to_tc_datetime
        self
      end

      def to_datetime
        ::DateTime.civil(year, month, day, hour, minute, second, Rational(offset, 86400))
      end

      def to_time
        ::Time.at(strftime('%s').to_i)
      end

      def xmlschema
        strftime("%Y-%m-%dT%H:%M:%S%Z")
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

class Time
  # Ruby 1.8-cvs and early 1.9 series define private Time#to_date
  %w(to_date to_datetime).each do |method|
    if private_instance_methods.include?(method) || private_instance_methods.include?(method.to_sym)
      public method
    end
  end
end
