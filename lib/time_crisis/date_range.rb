class TimeCrisis::DateRange < Range
  def initialize(*args)
    options = args.last.is_a?(Hash) ? args.pop : {}

    # make compatibile with Range's normal arguments
    options[:begin] = args.shift unless args.empty?
    options[:end] = args.shift unless args.empty?
    options[:exclude_end] = args.shift unless args.empty?

    start = options[:begin].nil? ? false : options[:begin].to_tc_date
    stop = options[:end].nil? ? false : options[:end].to_tc_date

    unit = options[:unit] || 1
    scale = options[:scale] || 'years'
    scale = scale.pluralize if scale.respond_to?(:pluralize)

    if start && !stop
      stop = start.advance({scale.to_sym => unit, :days => -1})
    elsif !start && stop
      start = stop.advance({scale.to_sym => -unit, :days => 1})
    end

    super(start, stop, options[:exclude_end] || false)
  end

  def include?(datelike)
    super(datelike.to_tc_date)
  end

  def each_slice_by_date(*args, &block)
    dates = args.map! do |datelike|
      date = datelike.to_tc_date
      raise ArgumentError, "Date not within range: #{date}" unless self.include?(date)
      date
    end
    dates.sort!

    start = self.begin

    dates.each do |date|
      yield self.class.new(start, date, true)
      start = date
    end

    yield self.class.new(start, self.end, self.exclude_end?)
  end

  def each_slice_by_period(period, unit=1, &block)
    start = self.begin
    nstart = start.advance(period.to_sym => unit)

    raise ArgumentError, "Period exceeds range" if nstart >= self.real_end

    while nstart < self.real_end
      yield self.class.new(start, nstart, true)
      start = nstart
      nstart = start.advance(period.to_sym => unit)
    end

    yield self.class.new(start, self.end, self.exclude_end?)
  end

  def each_month(&block)
    each_slice_by_period(:months, 1, &block)
  end

  def each_year(&block)
    each_slice_by_period(:years, 1, &block)
  end

  protected

  def real_end
    @real_end ||= self.exclude_end? ? self.end.advance({:days => -1}) : self.end
  end
end

module TimeCrisis::DateRange::Date
  module InstanceMethods
    def from(unit, scale)
      self.range(unit, scale, 'past')
    end

    def for(unit, scale)
      self.range(unit, scale, 'future')
    end

    def range(unit=1, scale='years', direction='past')
      selfkey = direction == 'past' ? :end : :begin
      self.class.range({selfkey => self, :unit => unit, :scale => scale})
    end
  end

  module ClassMethods
    def range(*args)
      TimeCrisis::DateRange.new(*args)
    end
  end
end

TimeCrisis::Date.send(:include, TimeCrisis::DateRange::Date::InstanceMethods)
TimeCrisis::Date.extend(TimeCrisis::DateRange::Date::ClassMethods)

::Date.send(:include, TimeCrisis::DateRange::Date::InstanceMethods)
::Date.extend(TimeCrisis::DateRange::Date::ClassMethods)
