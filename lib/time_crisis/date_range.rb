module TimeCrisis::DateRange
  module InstanceMethods
    def from(unit, scale)
      range(unit, scale, 'past')
    end

    def for(unit, scale)
      range(unit, scale, 'future')
    end

    def range(unit=nil, scale=nil, direction=nil)
      direction ||= 'past'
      unit ||= 1
      scale ||= 'years'

      scale = scale.pluralize if scale.respond_to?(:pluralize)

      period_base = self.to_date
      period_advance = period_base.
        advance({scale.to_sym => (direction == 'past' ? -unit : unit)})

      # I'd rather be using ..., but I need to flip-flop the range order
      if direction == 'past'
        (period_advance.advance(:days => 1))..period_base
      else
        period_base..(period_advance.advance(:days => -1))
      end
    end
  end

  module ClassMethods
    def range(options={})
      start = options[:begin].nil? ? false : options[:begin].to_date
      stop = options[:end].nil? ? false : options[:end].to_date

      scale = options[:scale] || 'years'
      unit = options[:unit] || 1

      if start && !stop
        start.for(unit, scale)
      elsif !start && stop
        stop.from(unit, scale)
      elsif start && stop
        (start..stop)
      else
        raise ArgumentError, "Cannot create a range with neither start nor end..."
      end
    end
  end
end

Date.send(:include, TimeCrisis::DateRange::InstanceMethods)
Date.extend(TimeCrisis::DateRange::ClassMethods)
