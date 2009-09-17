module TimeCrisis::Support::DaysInMonth
  GregorianDaysInMonth = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def days_in_month(month, year = current.year)
    (month == 2 && ::Date.gregorian_leap?(year)) ? 29 : GregorianDaysInMonth[month]
  end
end

Date.extend(TimeCrisis::Support::DaysInMonth) unless Date.respond_to?(:days_in_month)
Time.extend(TimeCrisis::Support::DaysInMonth) unless Time.respond_to?(:days_in_month)
DateTime.extend(TimeCrisis::Support::DaysInMonth) unless DateTime.respond_to?(:days_in_month)
