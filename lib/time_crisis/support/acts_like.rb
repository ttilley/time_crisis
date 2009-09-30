module TimeCrisis::Support::ActsLike
  module Date
    def acts_like_date?
      true
    end
  end

  module DateTime
    def acts_like_date?
      true
    end

    def acts_like_time?
      true
    end
  end
end

Date.send(:include, TimeCrisis::Support::ActsLike::Date)
DateTime.send(:include, TimeCrisis::Support::ActsLike::DateTime)
