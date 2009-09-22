module TimeCrisis
  # Meteorological seasons are reckoned by temperature, with summer being
  # the hottest quarter of the year and winter the coldest quarter of the
  # year. Using this reckoning, the Roman calendar began the year and the
  # spring season on the first of March, with each season occupying three
  # months. In 1780 the Societas Meteorologica Palatina, an early
  # international organization for meteorology, defined seasons as groupings
  # of three whole months. Ever since, professional meteorologists
  # everywhere have used this definition. So, in meteorology for the
  # Northern hemisphere: spring begins on 1 March, summer on 1 June, autumn
  # on 1 September, and winter on 1 December.
  # - http://en.wikipedia.org/wiki/Season
  module MeteorologicalSeasons
    module ClassMethods
      def beginning_of_meteorological_spring(year=current.year)
        TimeCrisis::Date.civil(year, 3, 1)
      end

      def beginning_of_meteorological_summer(year=current.year)
        TimeCrisis::Date.civil(year, 6, 1)
      end

      def beginning_of_meteorological_autumn(year=current.year)
        TimeCrisis::Date.civil(year, 9, 1)
      end
      alias beginning_of_meteorological_fall beginning_of_meteorological_autumn

      def beginning_of_meteorological_winter(year=current.year)
        TimeCrisis::Date.civil(year, 12, 1)
      end
    end
    
    module InstanceMethods
      def meteorological_spring?
        [3,4,5].include?(self.month)
      end
      
      def meteorological_summer?
        [6,7,8].include?(self.month)
      end
      
      def meteorological_autumn?
        [9,10,11].include?(self.month)
      end
      alias meteorological_fall? meteorological_autumn?
      
      def meteorological_winter?
        [1,2,12].include?(self.month)
      end
      
      def meteorological_season
        case self.month
        when (1..2) then 'winter'
        when (3..5) then 'spring'
        when (6..8) then 'summer'
        when (9..11) then 'fall'
        when 12 then 'winter'
        end
      end
    end
  end
end

TimeCrisis::Date.extend(TimeCrisis::MeteorologicalSeasons::ClassMethods)
TimeCrisis::Date.send(:include, TimeCrisis::MeteorologicalSeasons::InstanceMethods)
