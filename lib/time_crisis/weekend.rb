module TimeCrisis::Weekend
  def weekend?
    [6, 0].include? self.wday
  end

  def weekday?
    !weekend?
  end
end

::TimeCrisis::Date.send(:include, TimeCrisis::Weekend)
::TimeCrisis::DateTime.send(:include, TimeCrisis::Weekend)
::TimeCrisis::Time.send(:include, TimeCrisis::Weekend)
