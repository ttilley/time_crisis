require 'rational'

module TimeCrisis
  module TZInfo

    # Methods to support different versions of Ruby.
    module RubyCoreSupport #:nodoc:

      # Use Rational.new! for performance reasons in Ruby 1.8.
      # This has been removed from 1.9, but Rational performs better.
      if Rational.respond_to? :new!
        def self.rational_new!(numerator, denominator = 1)
          Rational.new!(numerator, denominator)
        end
      else
        def self.rational_new!(numerator, denominator = 1)
          Rational(numerator, denominator)
        end
      end

      def self.datetime_new!(ajd = 0, offset = 0, sg = nil)
        if offset < 0
          offset = 1 + offset
        end

        jd, fract = (ajd + offset + Rational(1, 2)).divmod(1)

        ::TimeCrisis::DateTime.jd_fract(jd.to_i, fract.to_f)
      end

    end
  end
end
