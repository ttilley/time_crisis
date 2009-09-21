require 'rational'

module TimeCrisis::Support::Conversions
  module Date
    def to_date
      self
    end if RUBY_VERSION < '1.9'

    def to_time(form = :local)
      ::Time.send(form, year, month, day)
    end

    def to_datetime
      ::DateTime.civil(year, month, day, 0, 0, 0, 0)
    end if RUBY_VERSION < '1.9'
  end

  module Time
    def to_date
      ::Date.new(year, month, day)
    end

    def to_time
      self
    end

    def to_datetime
      ::DateTime.civil(year, month, day, hour, min, sec, Rational(utc_offset, 86400))
    end
  end

  module DateTime
    def to_date
      ::Date.civil(year, month, day)
    end

    def to_time
      self.offset == 0 ? ::Time.utc(year, month, day, hour, min, sec) : self
    end

    def to_datetime
      self
    end
  end

  module String
    def to_time(form = :utc)
      d = ::Date._parse(self, false).values_at(:year, :mon, :mday, :hour, :min, :sec, :sec_fraction).map { |arg| arg || 0 }
      d[6] *= 1000000
      ::Time.send(form, *d)
    end

    def to_date
      ::Date.civil(*::Date._parse(self, false).values_at(:year, :mon, :mday))
    end

    def to_datetime
      d = ::Date._parse(self, false).values_at(:year, :mon, :mday, :hour, :min, :sec, :zone, :sec_fraction).map { |arg| arg || 0 }
      d[5] += d.pop
      ::DateTime.civil(*d)
    end
  end
end

# active support has support for time zones, so don't overwrite its' version
unless Time.instance_methods.include?('local_time')
  Date.class_eval do
    # Ruby 1.9 has Date#to_time which converts to localtime only.
    remove_method :to_time if instance_methods.include?(:to_time)
    include TimeCrisis::Support::Conversions::Date
  end

  DateTime.class_eval do
    # Ruby 1.9 has DateTime#to_time which internally relies on Time.
    remove_method :to_time if instance_methods.include?(:to_time)
    include TimeCrisis::Support::Conversions::DateTime
  end
end

Time.send(:include, TimeCrisis::Support::Conversions::Time)

String.send(:include, TimeCrisis::Support::Conversions::String)
