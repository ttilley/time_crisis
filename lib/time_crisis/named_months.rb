module TimeCrisis
  module NamedMonths
    def january(year=nil);    month_range(1, year); end
    def february(year=nil);   month_range(2, year); end
    def march(year=nil);      month_range(3, year); end
    def april(year=nil);      month_range(4, year); end
    def may(year=nil);        month_range(5, year); end
    def june(year=nil);       month_range(6, year); end
    def july(year=nil);       month_range(7, year); end
    def august(year=nil);     month_range(8, year); end
    def september(year=nil);  month_range(9, year); end
    def october(year=nil);    month_range(10, year); end
    def november(year=nil);   month_range(11, year); end
    def december(year=nil);   month_range(12, year); end
    
    def month_range(month, year = nil)
      year ||= current.year
      base = ::Date.civil(year, month, 1)
      base.for(1, 'months')
    end
  end
end

Date.extend(TimeCrisis::NamedMonths)
