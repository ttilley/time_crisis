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
    def beginning_of_meteorological_spring
      ::Date.civil(self.year, 3, 1)
    end
    
    def beginning_of_meteorological_summer
      ::Date.civil(self.year, 6, 1)
    end
    
    def beginning_of_meteorological_autumn
      ::Date.civil(self.year, 9, 1)
    end
    alias beginning_of_meteorological_fall beginning_of_meteorological_autumn
    
    def beginning_of_meteorological_winter
      ::Date.civil(self.year, 12, 1)
    end
    
    def meteorological_spring?
      (beginning_of_meteorological_spring...beginning_of_meteorological_summer).include?(self)
    end
    
    def meteorological_summer?
      (beginning_of_meteorological_summer...beginning_of_meteorological_autumn).include?(self)
    end
    
    def meteorological_autumn?
      (beginning_of_meteorological_autumn...beginning_of_meteorological_winter).include?(self)
    end
    
    def meteorological_winter?
      (beginning_of_year...beginning_of_meteorological_spring).include?(self) ||
      (beginning_of_meteorological_winter..end_of_year).include?(self)
    end
    
    def meteorological_season
      return 'spring' if meteorological_spring?
      return 'summer' if meteorological_summer?
      return 'fall' if meteorological_autumn?
      return 'winter' if meteorological_winter?
    end
  end
end

Date.send(:include, TimeCrisis::MeteorologicalSeasons)
