class ::Date
  def to_tc_date
    TimeCrisis::Date.civil(year, month, day)
  end

  def to_tc_datetime
    TimeCrisis::DateTime.civil(year, month, day, 0, 0, 0, 0)
  end
  
  def to_tc_time(form = :local)
    ::TimeCrisis::Time.send(form, year, month, day)
  end
end

class ::Time
  def to_tc_date
    TimeCrisis::Date.civil(year, month, day)
  end

  def to_tc_datetime
    TimeCrisis::DateTime.civil(year, month, day, hour, min, sec, 0, utc_offset)
  end
  
  def to_tc_time
    TimeCrisis::Time.at(self.to_f)
  end
end

class ::DateTime
  def to_tc_date
    TimeCrisis::Date.civil(year, month, day)
  end

  def to_tc_datetime
    TimeCrisis::DateTime.civil(year, month, day, hour, min, sec, 0, (offset * 86400).to_i)
  end
  
  def to_tc_time
    TimeCrisis::Time.at(self.to_f)
  end
end

class ::String
  def to_tc_date(opts={})
    TimeCrisis::Date.parse(self, opts)
  end

  def to_tc_datetime(opts={})
    TimeCrisis::DateTime.parse(self, opts)
  end
end
