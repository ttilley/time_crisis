require 'time_crisis/support/basic_object'

module TimeCrisis
  class Duration < BasicObject
    attr_accessor :value, :parts

    def initialize(value, parts) #:nodoc:
      @value, @parts = value, parts
    end

    def +(other)
      if Duration === other
        Duration.new(value + other.value, @parts + other.parts)
      else
        Duration.new(value + other, @parts + [[:seconds, other]])
      end
    end

    def -(other)
      self + (-other)
    end

    def -@ #:nodoc:
      Duration.new(-value, parts.map { |type,number| [type, -number] })
    end

    def is_a?(klass) #:nodoc:
      klass == Duration || super
    end

    def ==(other)
      if Duration === other
        other.value == value
      else
        other == value
      end
    end

    def self.===(other) #:nodoc:
      other.is_a?(Duration) rescue super
    end

    def since(time = ::Time.current)
      sum(1, time)
    end
    alias :from_now :since

    def ago(time = ::Time.current)
      sum(-1, time)
    end
    alias :until :ago

    def inspect #:nodoc:
      consolidated = parts.inject(::Hash.new(0)) { |h,part| h[part.first] += part.last; h }
      parts = [:years, :months, :days, :minutes, :seconds].map do |length|
        n = consolidated[length]
        # "#{n} #{n == 1 ? length.to_s.singularize : length.to_s}" if n.nonzero?
        "#{n} #{length}" if n > 0
      end.compact
      parts = ["0 seconds"] if parts.empty?
      # parts.to_sentence(:locale => :en)
      parts.join(', ')
    end

    protected

    def sum(sign, time = ::Time.current) #:nodoc:
      parts.inject(time) do |t,(type,number)|
        if t.acts_like?(:time) || t.acts_like?(:date)
          if type == :seconds
            t.since(sign * number)
          else
            t.advance(type => sign * number)
          end
        else
          raise ::ArgumentError, "expected a time or date, got #{time.inspect}"
        end
      end
    end

    private

    def method_missing(method, *args, &block) #:nodoc:
      value.send(method, *args)
    end
  end
end
