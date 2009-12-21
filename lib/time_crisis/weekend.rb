module TimeCrisis::Weekend
  def weekend?
    [6,7].include? self.cwday
  end
end

TimeCrisis::Date.send(:include, TimeCrisis::Weekend)
TimeCrisis::DateTime.send(:include, TimeCrisis::Weekend)