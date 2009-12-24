require 'time_crisis/support/ext/object/acts_like'

module TimeCrisis
  class DateTime
    def acts_like_date?
      true
    end

    def acts_like_time?
      true
    end
  end
end
