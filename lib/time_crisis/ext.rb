module TimeCrisis
  class DateTime
    attr_accessor :offset

    def new_offset(n)
      self.offset = n
    end

    def +(d)
      case
        when d.is_a?(Integer)
          new_jd(jd+d)
        when d.respond_to?(:to_f)
          d, f = d.to_f.divmod(1)
          f = fract + f
          m, f = f.divmod(1)
          self.class.jd_fract(jd+d+m, f, @offset)
        else
          raise TypeError, "d must be an Integer or respond to :to_f"
      end
    end

    def -(d)
      case
        when d.is_a?(::TimeCrisis::DateTime)
          (jd - d.jd) + (fract - d.fract) + (@offset - d.offset)/86400.0
        when d.is_a?(Integer)
          self + -d
        when d.respond_to?(:to_f)
          self + -(d.to_f)
        else
          raise TypeError, "d should be a TimeCrisis::DateTime, Integer, or respond to :to_f"
      end
    end

    def <=>(datetime)
      case
        when datetime.is_a?(::TimeCrisis::DateTime)
          ((d = super) == 0) && ((d = (hour <=> datetime.hour)) == 0) && ((d = (min <=> datetime.min)) == 0) && ((d = (sec <=> datetime.sec)) == 0) && ((d = (usec <=> datetime.usec)) == 0)
          d
        when datetime.is_a?(Integer)
          if ((d = (jd <=> datetime)) == 0)
            (hour == 0 and min == 0 and sec == 0 and usec == 0) ? 0 : 1
          else
            d
          end
        when datetime.respond_to?(:to_f)
          diff = jd+fract - datetime.to_f
          if diff.abs <= 1.15740740740741e-011
            0
          else
            diff > 0.0 ? 1 : -1
          end
        else
          raise TypeError, "d should be a TimeCrisis::DateTime, Integer, or respond to :to_f"
      end
    end

  end
end
